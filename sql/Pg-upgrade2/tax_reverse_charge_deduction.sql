-- @tag: tax_deduction_reverse_charge_key_19
-- @description: Vorsteuerabzug bei Reverse Charge für Kreditorenbelege Steuerschlüssel 19
-- @depends: release_3_6_0 clean_tax_18_19
-- @ignore: 0

UPDATE taxkeys SET pos_ustva = 61
  WHERE (
      chart_id = (SELECT id FROM chart WHERE accno = '1574')
      AND startdate = '1970-01-01'
      )
  AND EXISTS (
    SELECT coa FROM defaults
    WHERE defaults.coa='Germany-DATEV-SKR03EU'
);

UPDATE taxkeys SET pos_ustva = 61
  WHERE (
      chart_id = (SELECT id FROM chart WHERE accno = '1404')
      AND startdate = '1970-01-01'
      )
  AND EXISTS (
    SELECT coa FROM defaults
    WHERE defaults.coa='Germany-DATEV-SKR04EU'
);
