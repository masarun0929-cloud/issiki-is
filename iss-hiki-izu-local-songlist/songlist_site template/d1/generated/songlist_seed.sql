-- Generated from songlist CSV.
-- Source columns: B=title, D=artist, E=sing_count.
-- Run d1/schema.sql first, then this seed SQL.
BEGIN TRANSACTION;

INSERT INTO channels (code, name, sort_order) VALUES ('new', '歌った曲リスト', 1)
ON CONFLICT(code) DO UPDATE SET name = excluded.name, sort_order = excluded.sort_order;

INSERT INTO artists (name, normalized_name) VALUES ('=LOVE', '=love')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('≠ME', '≠me')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('164 feat.GUMI', '164 feat.gumi')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('25時、ナイトコードで。', '25時、ナイトコードで。')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('40mP feat. 初音ミク', '40mp feat. 初音ミク')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('40mP feat.初音ミク', '40mp feat.初音ミク')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('Ado', 'ado')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('After the Rain', 'after the rain')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('aiko', 'aiko')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('Aimer', 'aimer')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('AKB48', 'akb48')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('AKINO', 'akino')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('ALI PROJECT', 'ali project')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('AliA', 'alia')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('ano', 'ano')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('Aqu3ra,月見ヤチヨ(CV.早見沙織)', 'aqu3ra,月見ヤチヨ(cv.早見沙織)')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('Ayase feat. 初音ミク', 'ayase feat. 初音ミク')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('A応P', 'a応p')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('B.B.クイーンズ', 'b.b.クイーンズ')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('back number', 'back number')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('BoA', 'boa')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('BUMP OF CHICKEN', 'bump of chicken')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('B小町', 'b小町')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('CHiCO with HoneyWorks', 'chico with honeyworks')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('CHiCO with HoneyWorks meets まふまふ', 'chico with honeyworks meets まふまふ')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('Chinozo feat. v flower', 'chinozo feat. v flower')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('Creepy Nuts', 'creepy nuts')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('CUTIE STREET', 'cutie street')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('DALI', 'dali')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('DAOKO × 米津玄師', 'daoko × 米津玄師')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('day after tomorrow', 'day after tomorrow')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('DECO*27 feat. GUMI', 'deco*27 feat. gumi')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('DECO*27 feat. 初音ミク', 'deco*27 feat. 初音ミク')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('DECO*27 feat.初音ミク', 'deco*27 feat.初音ミク')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('DECO*27,Rockwell feat,初音ミク', 'deco*27,rockwell feat,初音ミク')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('DECO*27,Rockwell feat. 初音ミク', 'deco*27,rockwell feat. 初音ミク')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('DECO*27,Rockwell feat.初音ミク', 'deco*27,rockwell feat.初音ミク')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('DECO*27,ピノキオピー feat. 初音ミク', 'deco*27,ピノキオピー feat. 初音ミク')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('DOMOTO(KinKi Kids)', 'domoto(kinki kids)')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('doriko feat.初音ミク', 'doriko feat.初音ミク')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('DREAMS COME TRUE', 'dreams come true')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('Easy Pop feat.巡音ルカ,GUMI', 'easy pop feat.巡音ルカ,gumi')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('EGOIST', 'egoist')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('feat. asmi, すりぃ/MAISONdes', 'feat. asmi, すりぃ/maisondes')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('feat. ちゅーたん(CV.早見沙織)/HoneyWorks', 'feat. ちゅーたん(cv.早見沙織)/honeyworks')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('feat. 花譜,ツミキ/MAISONdes', 'feat. 花譜,ツミキ/maisondes')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('feat. 涼海ひより(CV.水瀬いのり)/HoneyWorks', 'feat. 涼海ひより(cv.水瀬いのり)/honeyworks')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('fhána', 'fhána')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('FIELD OF VIEW', 'field of view')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('Folder5', 'folder5')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('FripSide', 'fripside')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('FRUITS ZIPPER', 'fruits zipper')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('GEMN', 'gemn')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('GLAY', 'glay')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('GRe4N BOYZ(GReeeeN)', 'gre4n boyz(greeeen)')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('HANA', 'hana')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('HIMEHINA', 'himehina')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('Honey Works feat. Kotoha', 'honey works feat. kotoha')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('HoneyWorks feat. GUMI', 'honeyworks feat. gumi')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('HoneyWorks feat. 初音ミク', 'honeyworks feat. 初音ミク')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('HoneyWorks feat.鏡音リン,鏡音レン', 'honeyworks feat.鏡音リン,鏡音レン')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('HY', 'hy')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('I WiSH', 'i wish')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('iroha(sasaki) feat. 鏡音リン', 'iroha(sasaki) feat. 鏡音リン')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('JITTERIN''JINN(cover Whiteberry)', 'jitterin''jinn(cover whiteberry)')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('JUDY AND MARY', 'judy and mary')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('JUJU', 'juju')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('Junky feat. 鏡音リン', 'junky feat. 鏡音リン')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('Junky feat.鏡音リン', 'junky feat.鏡音リン')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('Kanaria feat. GUMI', 'kanaria feat. gumi')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('kemu feat.GUMI', 'kemu feat.gumi')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('kemu feat.IA', 'kemu feat.ia')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('King Gnu', 'king gnu')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('koyori(電ポルP) feat. Sou', 'koyori(電ポルp) feat. sou')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('koyori(電ポルP) feat.v flower', 'koyori(電ポルp) feat.v flower')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('koyori(電ポルP) feat.初音ミク', 'koyori(電ポルp) feat.初音ミク')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('Last Note. feat.GUMI', 'last note. feat.gumi')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('Linked Horizon', 'linked horizon')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('LiSA', 'lisa')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('livetune feat.初音ミク', 'livetune feat.初音ミク')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('M!LK', 'm!lk')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('MAHO堂', 'maho堂')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('May''n,中島 愛', 'may''n,中島 愛')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('miwa', 'miwa')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('mona(CV.夏川椎菜) feat.HoneyWorks', 'mona(cv.夏川椎菜) feat.honeyworks')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('MONGOL800', 'mongol800')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('Mr.Children', 'mr.children')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('Mrs. GREEN APPLE', 'mrs. green apple')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('My Little Lover', 'my little lover')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('n-buna feat. 初音ミク', 'n-buna feat. 初音ミク')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('n-buna feat.初音ミク', 'n-buna feat.初音ミク')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('Neru feat. 鏡音リン', 'neru feat. 鏡音リン')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('Neru feat. 鏡音レン', 'neru feat. 鏡音レン')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('NEWS', 'news')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('niki feat.Lily', 'niki feat.lily')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('Official髭男dism', 'official髭男dism')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('ORANGE RANGE', 'orange range')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('Orangestar feat. 初音ミク', 'orangestar feat. 初音ミク')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('Orangestar feat.IA', 'orangestar feat.ia')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('Perfume', 'perfume')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('P丸様。', 'p丸様。')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('RADWIMPS', 'radwimps')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('Reol', 'reol')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('ryo (supercell) feat.かぐや(CV.夏吉ゆうこ)', 'ryo (supercell) feat.かぐや(cv.夏吉ゆうこ)')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('ryo (supercell) feat.かぐや(CV.夏吉ゆうこ) 月見ヤチヨ(CV.早見沙織)', 'ryo (supercell) feat.かぐや(cv.夏吉ゆうこ) 月見ヤチヨ(cv.早見沙織)')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('ryo(supercell) feat. 初音ミク', 'ryo(supercell) feat. 初音ミク')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('samfree feat. 巡音ルカ', 'samfree feat. 巡音ルカ')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('SCANDAL', 'scandal')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('SMAP', 'smap')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('Snow Man', 'snow man')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('SPEED', 'speed')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('SunSet Swish', 'sunset swish')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('supercell feat.初音ミク', 'supercell feat.初音ミク')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('Superfly', 'superfly')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('SURFACE', 'surface')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('syudou feat.可不', 'syudou feat.可不')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('T.M.Revolution', 't.m.revolution')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('T.M.Revolution×水樹奈々', 't.m.revolution×水樹奈々')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('TK from 凛として時雨', 'tk from 凛として時雨')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('TOKOTOKO(西沢さんP) feat. GUMI', 'tokotoko(西沢さんp) feat. gumi')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('tuki.', 'tuki.')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('TWICE', 'twice')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('UNISON SQUARE GARDEN', 'unison square garden')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('wotaku feat. 初音ミク', 'wotaku feat. 初音ミク')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('wowaka feat. 初音ミク', 'wowaka feat. 初音ミク')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('YM feat. GUMI', 'ym feat. gumi')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('YOASOBI', 'yoasobi')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('YOASOBI(RADWIMPS Cover)', 'yoasobi(radwimps cover)')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('YUI', 'yui')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('yuigot,月見ヤチヨ(CV.早見沙織)', 'yuigot,月見ヤチヨ(cv.早見沙織)')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('Yukopi feat. 歌愛ユキ', 'yukopi feat. 歌愛ユキ')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('ZARD', 'zard')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('ZONE', 'zone')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('アイナ・ジ・エンド', 'アイナ・ジ・エンド')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('あいみょん', 'あいみょん')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('アンジェラ・アキ', 'アンジェラ・アキ')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('いきものがかり', 'いきものがかり')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('いよわ feat. 可不', 'いよわ feat. 可不')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('うたたP feat. 初音ミク', 'うたたp feat. 初音ミク')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('かいりきベア feat. v flower', 'かいりきベア feat. v flower')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('かいりきベア feat. 初音ミク', 'かいりきベア feat. 初音ミク')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('かいりきベア feat.初音ミク', 'かいりきベア feat.初音ミク')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('かてらざわ feat. 重音テト,初音ミク', 'かてらざわ feat. 重音テト,初音ミク')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('ギガP feat. 初音ミク', 'ギガp feat. 初音ミク')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('きただにひろし', 'きただにひろし')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('キタニタツヤ', 'キタニタツヤ')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('きゃりーぱみゅぱみゅ', 'きゃりーぱみゅぱみゅ')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('グミ(日向めぐみ)', 'グミ(日向めぐみ)')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('クリープハイプ', 'クリープハイプ')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('ゴールデンボンバー', 'ゴールデンボンバー')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('ゴジマジP feat. 重音テト', 'ゴジマジp feat. 重音テト')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('こっちのけんと', 'こっちのけんと')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('サカナクション', 'サカナクション')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('サスケ', 'サスケ')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('さユり', 'さユり')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('シカ部', 'シカ部')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('しぐれうい', 'しぐれうい')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('じん feat.IA', 'じん feat.ia')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('スキマスイッチ', 'スキマスイッチ')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('すこっぷ feat. GUMI', 'すこっぷ feat. gumi')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('すこっぷ feat. 初音ミク', 'すこっぷ feat. 初音ミク')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('ずっと真夜中でいいのに。', 'ずっと真夜中でいいのに。')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('スピッツ', 'スピッツ')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('すりぃ feat,鏡音レン', 'すりぃ feat,鏡音レン')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('すりぃ feat. 鏡音レン', 'すりぃ feat. 鏡音レン')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('ちゃんみな', 'ちゃんみな')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('ツミキ feat. 可不', 'ツミキ feat. 可不')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('なきそ feat. 初音ミク', 'なきそ feat. 初音ミク')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('なきそ feat.歌愛ユキ', 'なきそ feat.歌愛ユキ')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('なとり', 'なとり')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('ナナホシ管弦楽団 feat.ONE', 'ナナホシ管弦楽団 feat.one')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('ナユタン星人 feat. 初音ミク', 'ナユタン星人 feat. 初音ミク')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('なるみや', 'なるみや')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('ぬぬぬぬぬぬぬぬぬぬぬぬぬぬぬぬ feat. 初音ミク', 'ぬぬぬぬぬぬぬぬぬぬぬぬぬぬぬぬ feat. 初音ミク')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('ぬゆり feat. v flower', 'ぬゆり feat. v flower')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('ぬゆり feat. v flower, 結月ゆかり', 'ぬゆり feat. v flower, 結月ゆかり')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('のりぴー feat. 鏡音レン', 'のりぴー feat. 鏡音レン')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('パジャマパーティーズ', 'パジャマパーティーズ')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('ハチ feat. GUMI', 'ハチ feat. gumi')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('ハチ feat.初音ミク,GUMI', 'ハチ feat.初音ミク,gumi')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('ハチワレ(CV.田中誠人)', 'ハチワレ(cv.田中誠人)')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('ハムちゃんず', 'ハムちゃんず')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('バルーン feat. v flower', 'バルーン feat. v flower')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('はろける feat. 雨衣,重音テト', 'はろける feat. 雨衣,重音テト')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('ピノキオピー feat. 初音ミク', 'ピノキオピー feat. 初音ミク')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('ピノキオピー feat. 初音ミク,重音テト', 'ピノキオピー feat. 初音ミク,重音テト')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('ピノキオピー feat.初音ミク', 'ピノキオピー feat.初音ミク')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('ファントムシータ', 'ファントムシータ')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('ポルノグラフィティ', 'ポルノグラフィティ')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('マカロニえんぴつ', 'マカロニえんぴつ')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('マサラダ feat. 重音テト', 'マサラダ feat. 重音テト')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('みきとP feat. 鏡音リン', 'みきとp feat. 鏡音リン')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('みきとP feat. 初音ミク', 'みきとp feat. 初音ミク')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('みきとP feat.GUMI,鏡音リン', 'みきとp feat.gumi,鏡音リン')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('みきとP feat.初音ミク', 'みきとp feat.初音ミク')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('もじゃ,れるりり feat. GUMI', 'もじゃ,れるりり feat. gumi')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('ももいろクローバーZ', 'ももいろクローバーz')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('ゆうゆ feat. 鏡音リン', 'ゆうゆ feat. 鏡音リン')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('ゆうゆ feat.初音ミク', 'ゆうゆ feat.初音ミク')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('ゆず', 'ゆず')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('ユリイ・カノン feat. GUMI', 'ユリイ・カノン feat. gumi')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('ヨーメイ', 'ヨーメイ')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('ヨルシカ', 'ヨルシカ')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('レミオロメン', 'レミオロメン')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('れるりり feat. 初音ミク', 'れるりり feat. 初音ミク')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('れるりり feat.初音ミク,GUMI', 'れるりり feat.初音ミク,gumi')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('ロードオブメジャー', 'ロードオブメジャー')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('ロクデナ', 'ロクデナ')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('亜沙 feat.重音テト', '亜沙 feat.重音テト')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('愛内里菜', '愛内里菜')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('一青窈', '一青窈')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('宇多田ヒカル', '宇多田ヒカル')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('雨良(Amala) feat. 初音ミク,重音テト', '雨良(amala) feat. 初音ミク,重音テト')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('荻野目洋子', '荻野目洋子')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('吉田夜世 feat. 重音テト', '吉田夜世 feat. 重音テト')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('吉本おじさん feat. 雨衣', '吉本おじさん feat. 雨衣')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('郷ひろみ', '郷ひろみ')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('玉置成実', '玉置成実')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('君をのせて', '君をのせて')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('結束バンド', '結束バンド')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('原口沙輔 feat. 重音テト', '原口沙輔 feat. 重音テト')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('倖田來未', '倖田來未')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('広瀬香美', '広瀬香美')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('香椎モイミ feat. 可不', '香椎モイミ feat. 可不')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('高橋ひろ', '高橋ひろ')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('高橋洋子', '高橋洋子')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('黒うさP feat.初音ミク', '黒うさp feat.初音ミク')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('修二と彰', '修二と彰')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('女王蜂', '女王蜂')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('松たか子', '松たか子')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('松本 梨香', '松本 梨香')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('新しい学校のリーダーズ', '新しい学校のリーダーズ')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('森山直太朗', '森山直太朗')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('神田沙也加,稲葉菜月,諸星すみれ', '神田沙也加,稲葉菜月,諸星すみれ')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('須田景凪', '須田景凪')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('水樹奈々', '水樹奈々')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('水樹奈々×T.M.Revolution', '水樹奈々×t.m.revolution')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('菅田将暉', '菅田将暉')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('星街すいせい', '星街すいせい')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('星野源', '星野源')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('西野カナ', '西野カナ')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('石田よう子', '石田よう子')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('千石撫子(CV.花澤香菜)', '千石撫子(cv.花澤香菜)')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('大塚愛', '大塚愛')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('中島美嘉', '中島美嘉')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('蝶々P feat. GUMI', '蝶々p feat. gumi')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('蝶々P feat. 初音ミク', '蝶々p feat. 初音ミク')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('椎名林檎', '椎名林檎')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('土間うまる(CV.田中あいみ)', '土間うまる(cv.田中あいみ)')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('東京事変', '東京事変')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('童謡', '童謡')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('日向電工 feat. 初音ミク', '日向電工 feat. 初音ミク')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('馬渡松子', '馬渡松子')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('柊キライ feat. v flower', '柊キライ feat. v flower')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('柊マグネタイト feat. 可不', '柊マグネタイト feat. 可不')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('柊マグネタイト feat. 重音テト', '柊マグネタイト feat. 重音テト')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('柊マグネタイト feat. 初音ミク', '柊マグネタイト feat. 初音ミク')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('柊マグネタイト feat. 亞北ネル(初音ミク)', '柊マグネタイト feat. 亞北ネル(初音ミク)')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('氷川きよし', '氷川きよし')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('米津玄師', '米津玄師')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('米津玄師&宇多田ヒカル', '米津玄師&宇多田ヒカル')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('宝鐘マリン', '宝鐘マリン')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('優里', '優里')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('友成空', '友成空')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('嵐', '嵐')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('涼宮ハルヒ(CV.平野綾),長門有希(CV.茅原実里),朝比奈みくる(CV.後藤邑子)', '涼宮ハルヒ(cv.平野綾),長門有希(cv.茅原実里),朝比奈みくる(cv.後藤邑子)')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('緑黄色社会', '緑黄色社会')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('林原めぐみ', '林原めぐみ')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('鈴木結女', '鈴木結女')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('和ぬか', '和ぬか')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('和田たけあき(くらげP) feat. 結月ゆかり', '和田たけあき(くらげp) feat. 結月ゆかり')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('和田たけあき(くらげP) feat.初音ミク', '和田たけあき(くらげp) feat.初音ミク')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('和田光司', '和田光司')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('欅坂46', '欅坂46')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;
INSERT INTO artists (name, normalized_name) VALUES ('μ''s', 'μ''s')
ON CONFLICT(normalized_name) DO UPDATE SET name = excluded.name;

INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('愛唄', '愛唄', (SELECT id FROM artists WHERE normalized_name = 'gre4n boyz(greeeen)'), '愛唄__gre4n boyz(greeeen)')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('愛言葉III', '愛言葉iii', (SELECT id FROM artists WHERE normalized_name = 'deco*27 feat. 初音ミク'), '愛言葉iii__deco*27 feat. 初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('会いたくて 会いたくて', '会いたくて 会いたくて', (SELECT id FROM artists WHERE normalized_name = '西野カナ'), '会いたくて 会いたくて__西野カナ')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('あいつら全員同窓会', 'あいつら全員同窓会', (SELECT id FROM artists WHERE normalized_name = 'ずっと真夜中でいいのに。'), 'あいつら全員同窓会__ずっと真夜中でいいのに。')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('アイドル', 'アイドル', (SELECT id FROM artists WHERE normalized_name = 'yoasobi'), 'アイドル__yoasobi')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('アイネクライネ', 'アイネクライネ', (SELECT id FROM artists WHERE normalized_name = '米津玄師'), 'アイネクライネ__米津玄師')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('愛のかたまり', '愛のかたまり', (SELECT id FROM artists WHERE normalized_name = 'domoto(kinki kids)'), '愛のかたまり__domoto(kinki kids)')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('アイのシナリオ', 'アイのシナリオ', (SELECT id FROM artists WHERE normalized_name = 'chico with honeyworks'), 'アイのシナリオ__chico with honeyworks')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('愛包ダンスホール', '愛包ダンスホール', (SELECT id FROM artists WHERE normalized_name = 'himehina'), '愛包ダンスホール__himehina')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('曖昧劣情Lover', '曖昧劣情lover', (SELECT id FROM artists WHERE normalized_name = 'koyori(電ポルp) feat.v flower'), '曖昧劣情lover__koyori(電ポルp) feat.v flower')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('IRIS OUT', 'iris out', (SELECT id FROM artists WHERE normalized_name = '米津玄師'), 'iris out__米津玄師')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('アイワナムチュー', 'アイワナムチュー', (SELECT id FROM artists WHERE normalized_name = 'feat. asmi, すりぃ/maisondes'), 'アイワナムチュー__feat. asmi, すりぃ/maisondes')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('愛をこめて花束を', '愛をこめて花束を', (SELECT id FROM artists WHERE normalized_name = 'superfly'), '愛をこめて花束を__superfly')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('青いベンチ', '青いベンチ', (SELECT id FROM artists WHERE normalized_name = 'サスケ'), '青いベンチ__サスケ')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('青空のラプソディ', '青空のラプソディ', (SELECT id FROM artists WHERE normalized_name = 'fhána'), '青空のラプソディ__fhána')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('青のすみか', '青のすみか', (SELECT id FROM artists WHERE normalized_name = 'キタニタツヤ'), '青のすみか__キタニタツヤ')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('アゲハ蝶', 'アゲハ蝶', (SELECT id FROM artists WHERE normalized_name = 'ポルノグラフィティ'), 'アゲハ蝶__ポルノグラフィティ')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('阿修羅ちゃん', '阿修羅ちゃん', (SELECT id FROM artists WHERE normalized_name = 'ado'), '阿修羅ちゃん__ado')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('アスノヨゾラ哨戒班', 'アスノヨゾラ哨戒班', (SELECT id FROM artists WHERE normalized_name = 'orangestar feat.ia'), 'アスノヨゾラ哨戒班__orangestar feat.ia')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('明日への扉', '明日への扉', (SELECT id FROM artists WHERE normalized_name = 'i wish'), '明日への扉__i wish')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('アタシは問題作', 'アタシは問題作', (SELECT id FROM artists WHERE normalized_name = 'ado'), 'アタシは問題作__ado')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('あなたに', 'あなたに', (SELECT id FROM artists WHERE normalized_name = 'mongol800'), 'あなたに__mongol800')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('アニマル', 'アニマル', (SELECT id FROM artists WHERE normalized_name = 'deco*27,rockwell feat.初音ミク'), 'アニマル__deco*27,rockwell feat.初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('アノニマス', 'アノニマス', (SELECT id FROM artists WHERE normalized_name = 'さユり'), 'アノニマス__さユり')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('あのバンド', 'あのバンド', (SELECT id FROM artists WHERE normalized_name = '結束バンド'), 'あのバンド__結束バンド')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('アポロ', 'アポロ', (SELECT id FROM artists WHERE normalized_name = 'ポルノグラフィティ'), 'アポロ__ポルノグラフィティ')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('天ノ弱', '天ノ弱', (SELECT id FROM artists WHERE normalized_name = '164 feat.gumi'), '天ノ弱__164 feat.gumi')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('雨とカプチーノ', '雨とカプチーノ', (SELECT id FROM artists WHERE normalized_name = 'ヨルシカ'), '雨とカプチーノ__ヨルシカ')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('アルエ', 'アルエ', (SELECT id FROM artists WHERE normalized_name = 'bump of chicken'), 'アルエ__bump of chicken')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('あわてんぼうのサンタクロース', 'あわてんぼうのサンタクロース', (SELECT id FROM artists WHERE normalized_name = '童謡'), 'あわてんぼうのサンタクロース__童謡')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('アンコール', 'アンコール', (SELECT id FROM artists WHERE normalized_name = 'yoasobi'), 'アンコール__yoasobi')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('UNDEAD', 'undead', (SELECT id FROM artists WHERE normalized_name = 'yoasobi'), 'undead__yoasobi')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('アンドロイドガール', 'アンドロイドガール', (SELECT id FROM artists WHERE normalized_name = 'deco*27 feat. 初音ミク'), 'アンドロイドガール__deco*27 feat. 初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('アンバランスなkissをして', 'アンバランスなkissをして', (SELECT id FROM artists WHERE normalized_name = '高橋ひろ'), 'アンバランスなkissをして__高橋ひろ')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('unravel', 'unravel', (SELECT id FROM artists WHERE normalized_name = 'tk from 凛として時雨'), 'unravel__tk from 凛として時雨')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('いーあるふぁんくらぶ', 'いーあるふぁんくらぶ', (SELECT id FROM artists WHERE normalized_name = 'みきとp feat.gumi,鏡音リン'), 'いーあるふぁんくらぶ__みきとp feat.gumi,鏡音リン')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('Ex-Otogibanashi', 'ex-otogibanashi', (SELECT id FROM artists WHERE normalized_name = 'ryo (supercell) feat.かぐや(cv.夏吉ゆうこ) 月見ヤチヨ(cv.早見沙織)'), 'ex-otogibanashi__ryo (supercell) feat.かぐや(cv.夏吉ゆうこ) 月見ヤチヨ(cv.早見沙織)')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('イガク', 'イガク', (SELECT id FROM artists WHERE normalized_name = '原口沙輔 feat. 重音テト'), 'イガク__原口沙輔 feat. 重音テト')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('行くぜっ!怪盗少女', '行くぜっ!怪盗少女', (SELECT id FROM artists WHERE normalized_name = 'ももいろクローバーz'), '行くぜっ!怪盗少女__ももいろクローバーz')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ignited -イグナイテッド-', 'ignited -イグナイテッド-', (SELECT id FROM artists WHERE normalized_name = 't.m.revolution'), 'ignited -イグナイテッド-__t.m.revolution')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('イケナイ太陽', 'イケナイ太陽', (SELECT id FROM artists WHERE normalized_name = 'orange range'), 'イケナイ太陽__orange range')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('言って。', '言って。', (SELECT id FROM artists WHERE normalized_name = 'ヨルシカ'), '言って。__ヨルシカ')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('命ばっかり', '命ばっかり', (SELECT id FROM artists WHERE normalized_name = 'ぬゆり feat. v flower, 結月ゆかり'), '命ばっかり__ぬゆり feat. v flower, 結月ゆかり')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('いますぐ輪廻', 'いますぐ輪廻', (SELECT id FROM artists WHERE normalized_name = 'なきそ feat. 初音ミク'), 'いますぐ輪廻__なきそ feat. 初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('INVOKE-インヴォーク-', 'invoke-インヴォーク-', (SELECT id FROM artists WHERE normalized_name = 't.m.revolution'), 'invoke-インヴォーク-__t.m.revolution')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ヴァンパイア', 'ヴァンパイア', (SELECT id FROM artists WHERE normalized_name = 'deco*27,rockwell feat. 初音ミク'), 'ヴァンパイア__deco*27,rockwell feat. 初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ウィーアー!', 'ウィーアー!', (SELECT id FROM artists WHERE normalized_name = 'きただにひろし'), 'ウィーアー!__きただにひろし')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('うい麦畑でつかまえて', 'うい麦畑でつかまえて', (SELECT id FROM artists WHERE normalized_name = 'しぐれうい'), 'うい麦畑でつかまえて__しぐれうい')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('Winter,again', 'winter,again', (SELECT id FROM artists WHERE normalized_name = 'glay'), 'winter,again__glay')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('WAVE', 'wave', (SELECT id FROM artists WHERE normalized_name = 'niki feat.lily'), 'wave__niki feat.lily')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ウタカタララバイ', 'ウタカタララバイ', (SELECT id FROM artists WHERE normalized_name = 'ado'), 'ウタカタララバイ__ado')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('打上花火', '打上花火', (SELECT id FROM artists WHERE normalized_name = 'daoko × 米津玄師'), '打上花火__daoko × 米津玄師')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('うっせぇわ', 'うっせぇわ', (SELECT id FROM artists WHERE normalized_name = 'ado'), 'うっせぇわ__ado')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ウミユリ海底譚', 'ウミユリ海底譚', (SELECT id FROM artists WHERE normalized_name = 'n-buna feat.初音ミク'), 'ウミユリ海底譚__n-buna feat.初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('うれしいひなまつり', 'うれしいひなまつり', (SELECT id FROM artists WHERE normalized_name = '童謡'), 'うれしいひなまつり__童謡')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('え?あぁ、そう。', 'え?あぁ、そう。', (SELECT id FROM artists WHERE normalized_name = '蝶々p feat. 初音ミク'), 'え?あぁ、そう。__蝶々p feat. 初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('永遠のあくる日', '永遠のあくる日', (SELECT id FROM artists WHERE normalized_name = 'ado'), '永遠のあくる日__ado')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('エイリアンエイリアン', 'エイリアンエイリアン', (SELECT id FROM artists WHERE normalized_name = 'ナユタン星人 feat. 初音ミク'), 'エイリアンエイリアン__ナユタン星人 feat. 初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('YELL', 'yell', (SELECT id FROM artists WHERE normalized_name = 'いきものがかり'), 'yell__いきものがかり')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('エゴロック', 'エゴロック', (SELECT id FROM artists WHERE normalized_name = 'すりぃ feat. 鏡音レン'), 'エゴロック__すりぃ feat. 鏡音レン')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('Everyday、カチューシャ', 'everyday、カチューシャ', (SELECT id FROM artists WHERE normalized_name = 'akb48'), 'everyday、カチューシャ__akb48')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('OK!', 'ok!', (SELECT id FROM artists WHERE normalized_name = '松本 梨香'), 'ok!__松本 梨香')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('大阪LOVER', '大阪lover', (SELECT id FROM artists WHERE normalized_name = 'dreams come true'), '大阪lover__dreams come true')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('oath sign', 'oath sign', (SELECT id FROM artists WHERE normalized_name = 'lisa'), 'oath sign__lisa')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('Over soul', 'over soul', (SELECT id FROM artists WHERE normalized_name = '林原めぐみ'), 'over soul__林原めぐみ')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('Overdose', 'overdose', (SELECT id FROM artists WHERE normalized_name = 'なとり'), 'overdose__なとり')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('オーバーライド', 'オーバーライド', (SELECT id FROM artists WHERE normalized_name = '吉田夜世 feat. 重音テト'), 'オーバーライド__吉田夜世 feat. 重音テト')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('おしゃかしゃま', 'おしゃかしゃま', (SELECT id FROM artists WHERE normalized_name = 'radwimps'), 'おしゃかしゃま__radwimps')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('おジャ魔女カーニバル!!', 'おジャ魔女カーニバル!!', (SELECT id FROM artists WHERE normalized_name = 'maho堂'), 'おジャ魔女カーニバル!!__maho堂')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('おじゃま虫', 'おじゃま虫', (SELECT id FROM artists WHERE normalized_name = 'deco*27 feat. 初音ミク'), 'おじゃま虫__deco*27 feat. 初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('おちゃめ機能', 'おちゃめ機能', (SELECT id FROM artists WHERE normalized_name = 'ゴジマジp feat. 重音テト'), 'おちゃめ機能__ゴジマジp feat. 重音テト')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('オツキミリサイタル', 'オツキミリサイタル', (SELECT id FROM artists WHERE normalized_name = 'じん feat.ia'), 'オツキミリサイタル__じん feat.ia')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('踊', '踊', (SELECT id FROM artists WHERE normalized_name = 'ado'), '踊__ado')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('オトナブルー', 'オトナブルー', (SELECT id FROM artists WHERE normalized_name = '新しい学校のリーダーズ'), 'オトナブルー__新しい学校のリーダーズ')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('オトノケ', 'オトノケ', (SELECT id FROM artists WHERE normalized_name = 'creepy nuts'), 'オトノケ__creepy nuts')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('乙女解剖', '乙女解剖', (SELECT id FROM artists WHERE normalized_name = 'deco*27 feat.初音ミク'), '乙女解剖__deco*27 feat.初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('乙女のポリシー', '乙女のポリシー', (SELECT id FROM artists WHERE normalized_name = '石田よう子'), '乙女のポリシー__石田よう子')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('おどるポンポコリン', 'おどるポンポコリン', (SELECT id FROM artists WHERE normalized_name = 'b.b.クイーンズ'), 'おどるポンポコリン__b.b.クイーンズ')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('鬼ノ宴', '鬼ノ宴', (SELECT id FROM artists WHERE normalized_name = '友成空'), '鬼ノ宴__友成空')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('おねがいダーリン', 'おねがいダーリン', (SELECT id FROM artists WHERE normalized_name = 'ナナホシ管弦楽団 feat.one'), 'おねがいダーリン__ナナホシ管弦楽団 feat.one')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('お勉強しといてよ', 'お勉強しといてよ', (SELECT id FROM artists WHERE normalized_name = 'ずっと真夜中でいいのに。'), 'お勉強しといてよ__ずっと真夜中でいいのに。')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('お返事まだカナ💦❓おじさん構文😁❗️', 'お返事まだカナ💦❓おじさん構文😁❗️', (SELECT id FROM artists WHERE normalized_name = '吉本おじさん feat. 雨衣'), 'お返事まだカナ💦❓おじさん構文😁❗️__吉本おじさん feat. 雨衣')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('おやすみ泣き声、さよなら歌姫', 'おやすみ泣き声、さよなら歌姫', (SELECT id FROM artists WHERE normalized_name = 'クリープハイプ'), 'おやすみ泣き声、さよなら歌姫__クリープハイプ')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('only my railgun', 'only my railgun', (SELECT id FROM artists WHERE normalized_name = 'fripside'), 'only my railgun__fripside')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('会心の一撃 YOASOBI Cover', '会心の一撃 yoasobi cover', (SELECT id FROM artists WHERE normalized_name = 'yoasobi(radwimps cover)'), '会心の一撃 yoasobi cover__yoasobi(radwimps cover)')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('会心の一撃', '会心の一撃', (SELECT id FROM artists WHERE normalized_name = 'radwimps'), '会心の一撃__radwimps')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('怪物', '怪物', (SELECT id FROM artists WHERE normalized_name = 'yoasobi'), '怪物__yoasobi')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('楓', '楓', (SELECT id FROM artists WHERE normalized_name = 'スピッツ'), '楓__スピッツ')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('輝きは君の中に', '輝きは君の中に', (SELECT id FROM artists WHERE normalized_name = '鈴木結女'), '輝きは君の中に__鈴木結女')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('かくしん的☆めたまるふぉ~ぜっ!', 'かくしん的☆めたまるふぉ~ぜっ!', (SELECT id FROM artists WHERE normalized_name = '土間うまる(cv.田中あいみ)'), 'かくしん的☆めたまるふぉ~ぜっ!__土間うまる(cv.田中あいみ)')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('革命デュアリズム', '革命デュアリズム', (SELECT id FROM artists WHERE normalized_name = '水樹奈々×t.m.revolution'), '革命デュアリズム__水樹奈々×t.m.revolution')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('革命道中', '革命道中', (SELECT id FROM artists WHERE normalized_name = 'アイナ・ジ・エンド'), '革命道中__アイナ・ジ・エンド')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('かくれんぼ', 'かくれんぼ', (SELECT id FROM artists WHERE normalized_name = 'alia'), 'かくれんぼ__alia')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('重音テトはこんなパーティ二人で抜け出せるのか', '重音テトはこんなパーティ二人で抜け出せるのか', (SELECT id FROM artists WHERE normalized_name = 'かてらざわ feat. 重音テト,初音ミク'), '重音テトはこんなパーティ二人で抜け出せるのか__かてらざわ feat. 重音テト,初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('カタオモイ', 'カタオモイ', (SELECT id FROM artists WHERE normalized_name = 'aimer'), 'カタオモイ__aimer')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('奏', '奏', (SELECT id FROM artists WHERE normalized_name = 'スキマスイッチ'), '奏__スキマスイッチ')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('歌舞伎町の女王', '歌舞伎町の女王', (SELECT id FROM artists WHERE normalized_name = '椎名林檎'), '歌舞伎町の女王__椎名林檎')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('カブトムシ', 'カブトムシ', (SELECT id FROM artists WHERE normalized_name = 'aiko'), 'カブトムシ__aiko')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('神っぽいな', '神っぽいな', (SELECT id FROM artists WHERE normalized_name = 'ピノキオピー feat.初音ミク'), '神っぽいな__ピノキオピー feat.初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('神のまにまに', '神のまにまに', (SELECT id FROM artists WHERE normalized_name = 'れるりり feat. 初音ミク'), '神のまにまに__れるりり feat. 初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('カリスマックス', 'カリスマックス', (SELECT id FROM artists WHERE normalized_name = 'snow man'), 'カリスマックス__snow man')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('カルマ', 'カルマ', (SELECT id FROM artists WHERE normalized_name = 'bump of chicken'), 'カルマ__bump of chicken')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('かわいいだけじゃだめですか?', 'かわいいだけじゃだめですか?', (SELECT id FROM artists WHERE normalized_name = 'cutie street'), 'かわいいだけじゃだめですか?__cutie street')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('可愛くてごめん', '可愛くてごめん', (SELECT id FROM artists WHERE normalized_name = 'feat. ちゅーたん(cv.早見沙織)/honeyworks'), '可愛くてごめん__feat. ちゅーたん(cv.早見沙織)/honeyworks')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('勘冴えて悔しいわ', '勘冴えて悔しいわ', (SELECT id FROM artists WHERE normalized_name = 'ずっと真夜中でいいのに。'), '勘冴えて悔しいわ__ずっと真夜中でいいのに。')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('キセキ', 'キセキ', (SELECT id FROM artists WHERE normalized_name = 'gre4n boyz(greeeen)'), 'キセキ__gre4n boyz(greeeen)')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ギターと孤独と蒼い惑星', 'ギターと孤独と蒼い惑星', (SELECT id FROM artists WHERE normalized_name = '結束バンド'), 'ギターと孤独と蒼い惑星__結束バンド')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('KICK BACK', 'kick back', (SELECT id FROM artists WHERE normalized_name = '米津玄師'), 'kick back__米津玄師')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('気まぐれロマンティック', '気まぐれロマンティック', (SELECT id FROM artists WHERE normalized_name = 'いきものがかり'), '気まぐれロマンティック__いきものがかり')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('キミと××××したいだけ', 'キミと××××したいだけ', (SELECT id FROM artists WHERE normalized_name = 'ファントムシータ'), 'キミと××××したいだけ__ファントムシータ')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('君はロックを聴かない', '君はロックを聴かない', (SELECT id FROM artists WHERE normalized_name = 'あいみょん'), '君はロックを聴かない__あいみょん')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('君をのせて', '君をのせて', (SELECT id FROM artists WHERE normalized_name = '君をのせて'), '君をのせて__君をのせて')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('逆光', '逆光', (SELECT id FROM artists WHERE normalized_name = 'ado'), '逆光__ado')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('Catch You Catch Me', 'catch you catch me', (SELECT id FROM artists WHERE normalized_name = 'グミ(日向めぐみ)'), 'catch you catch me__グミ(日向めぐみ)')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('キャットラビング', 'キャットラビング', (SELECT id FROM artists WHERE normalized_name = '香椎モイミ feat. 可不'), 'キャットラビング__香椎モイミ feat. 可不')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('きゅうくらりん', 'きゅうくらりん', (SELECT id FROM artists WHERE normalized_name = 'いよわ feat. 可不'), 'きゅうくらりん__いよわ feat. 可不')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('キューティーハニー', 'キューティーハニー', (SELECT id FROM artists WHERE normalized_name = '倖田來未'), 'キューティーハニー__倖田來未')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('キュートなカノジョ', 'キュートなカノジョ', (SELECT id FROM artists WHERE normalized_name = 'syudou feat.可不'), 'キュートなカノジョ__syudou feat.可不')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('狭心症', '狭心症', (SELECT id FROM artists WHERE normalized_name = 'radwimps'), '狭心症__radwimps')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('強風オールバック', '強風オールバック', (SELECT id FROM artists WHERE normalized_name = 'yukopi feat. 歌愛ユキ'), '強風オールバック__yukopi feat. 歌愛ユキ')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('キラキラ', 'キラキラ', (SELECT id FROM artists WHERE normalized_name = 'aiko'), 'キラキラ__aiko')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ギラギラ', 'ギラギラ', (SELECT id FROM artists WHERE normalized_name = 'ado'), 'ギラギラ__ado')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('金魚花火', '金魚花火', (SELECT id FROM artists WHERE normalized_name = '大塚愛'), '金魚花火__大塚愛')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('KING', 'king', (SELECT id FROM artists WHERE normalized_name = 'kanaria feat. gumi'), 'king__kanaria feat. gumi')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('金曜日のおはよう', '金曜日のおはよう', (SELECT id FROM artists WHERE normalized_name = 'honeyworks feat. gumi'), '金曜日のおはよう__honeyworks feat. gumi')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('グッバイ宣言', 'グッバイ宣言', (SELECT id FROM artists WHERE normalized_name = 'chinozo feat. v flower'), 'グッバイ宣言__chinozo feat. v flower')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('クラクラ', 'クラクラ', (SELECT id FROM artists WHERE normalized_name = 'ado'), 'クラクラ__ado')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('GLAMOROUS SKY', 'glamorous sky', (SELECT id FROM artists WHERE normalized_name = '中島美嘉'), 'glamorous sky__中島美嘉')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('クリスマスソング', 'クリスマスソング', (SELECT id FROM artists WHERE normalized_name = 'back number'), 'クリスマスソング__back number')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('紅蓮華', '紅蓮華', (SELECT id FROM artists WHERE normalized_name = 'lisa'), '紅蓮華__lisa')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('紅蓮の弓矢', '紅蓮の弓矢', (SELECT id FROM artists WHERE normalized_name = 'linked horizon'), '紅蓮の弓矢__linked horizon')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('群青', '群青', (SELECT id FROM artists WHERE normalized_name = 'yoasobi'), '群青__yoasobi')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('群青日和', '群青日和', (SELECT id FROM artists WHERE normalized_name = '東京事変'), '群青日和__東京事変')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ケッペキショウ', 'ケッペキショウ', (SELECT id FROM artists WHERE normalized_name = 'すこっぷ feat. gumi'), 'ケッペキショウ__すこっぷ feat. gumi')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('限界突破×サバイバー', '限界突破×サバイバー', (SELECT id FROM artists WHERE normalized_name = '氷川きよし'), '限界突破×サバイバー__氷川きよし')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('恋', '恋', (SELECT id FROM artists WHERE normalized_name = '星野源'), '恋__星野源')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('恋するフォーチュンクッキー', '恋するフォーチュンクッキー', (SELECT id FROM artists WHERE normalized_name = 'akb48'), '恋するフォーチュンクッキー__akb48')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('恋はスリル、ショック、サスペンス', '恋はスリル、ショック、サスペンス', (SELECT id FROM artists WHERE normalized_name = '愛内里菜'), '恋はスリル、ショック、サスペンス__愛内里菜')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('航海の唄', '航海の唄', (SELECT id FROM artists WHERE normalized_name = 'さユり'), '航海の唄__さユり')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ゴーストルール', 'ゴーストルール', (SELECT id FROM artists WHERE normalized_name = 'deco*27 feat. 初音ミク'), 'ゴーストルール__deco*27 feat. 初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('GOLDFINGER ''99', 'goldfinger ''99', (SELECT id FROM artists WHERE normalized_name = '郷ひろみ'), 'goldfinger ''99__郷ひろみ')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('心做し', '心做し', (SELECT id FROM artists WHERE normalized_name = '蝶々p feat. gumi'), '心做し__蝶々p feat. gumi')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('こちら、幸福安心委員会です。', 'こちら、幸福安心委員会です。', (SELECT id FROM artists WHERE normalized_name = 'うたたp feat. 初音ミク'), 'こちら、幸福安心委員会です。__うたたp feat. 初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('さぁ', 'さぁ', (SELECT id FROM artists WHERE normalized_name = 'surface'), 'さぁ__surface')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('サイノウサンプラー', 'サイノウサンプラー', (SELECT id FROM artists WHERE normalized_name = 'koyori(電ポルp) feat. sou'), 'サイノウサンプラー__koyori(電ポルp) feat. sou')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('サイレントマジョリティー', 'サイレントマジョリティー', (SELECT id FROM artists WHERE normalized_name = '欅坂46'), 'サイレントマジョリティー__欅坂46')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('Sign', 'sign', (SELECT id FROM artists WHERE normalized_name = 'mr.children'), 'sign__mr.children')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('サインはB', 'サインはb', (SELECT id FROM artists WHERE normalized_name = 'b小町'), 'サインはb__b小町')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('サウダージ', 'サウダージ', (SELECT id FROM artists WHERE normalized_name = 'ポルノグラフィティ'), 'サウダージ__ポルノグラフィティ')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('さくら (独唱)', 'さくら (独唱)', (SELECT id FROM artists WHERE normalized_name = '森山直太朗'), 'さくら (独唱)__森山直太朗')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('さくらんぼ', 'さくらんぼ', (SELECT id FROM artists WHERE normalized_name = '大塚愛'), 'さくらんぼ__大塚愛')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('雑魚', '雑魚', (SELECT id FROM artists WHERE normalized_name = '柊マグネタイト feat. 亞北ネル(初音ミク)'), '雑魚__柊マグネタイト feat. 亞北ネル(初音ミク)')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('サターン', 'サターン', (SELECT id FROM artists WHERE normalized_name = 'ずっと真夜中でいいのに。'), 'サターン__ずっと真夜中でいいのに。')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ザムザ', 'ザムザ', (SELECT id FROM artists WHERE normalized_name = '25時、ナイトコードで。'), 'ザムザ__25時、ナイトコードで。')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('さよならエレジー', 'さよならエレジー', (SELECT id FROM artists WHERE normalized_name = '菅田将暉'), 'さよならエレジー__菅田将暉')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('サリシノハラ', 'サリシノハラ', (SELECT id FROM artists WHERE normalized_name = 'みきとp feat.初音ミク'), 'サリシノハラ__みきとp feat.初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('3月9日', '3月9日', (SELECT id FROM artists WHERE normalized_name = 'レミオロメン'), '3月9日__レミオロメン')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('残機', '残機', (SELECT id FROM artists WHERE normalized_name = 'ずっと真夜中でいいのに。'), '残機__ずっと真夜中でいいのに。')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('残響散歌', '残響散歌', (SELECT id FROM artists WHERE normalized_name = 'aimer'), '残響散歌__aimer')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('三原色', '三原色', (SELECT id FROM artists WHERE normalized_name = 'yoasobi'), '三原色__yoasobi')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('残酷な天使のテーゼ', '残酷な天使のテーゼ', (SELECT id FROM artists WHERE normalized_name = '高橋洋子'), '残酷な天使のテーゼ__高橋洋子')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('366日', '366日', (SELECT id FROM artists WHERE normalized_name = 'hy'), '366日__hy')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('secret base〜君がくれたもの〜', 'secret base〜君がくれたもの〜', (SELECT id FROM artists WHERE normalized_name = 'zone'), 'secret base〜君がくれたもの〜__zone')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('シーソーゲーム 〜勇敢な恋の歌〜', 'シーソーゲーム 〜勇敢な恋の歌〜', (SELECT id FROM artists WHERE normalized_name = 'mr.children'), 'シーソーゲーム 〜勇敢な恋の歌〜__mr.children')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('JANE DOE', 'jane doe', (SELECT id FROM artists WHERE normalized_name = '米津玄師&宇多田ヒカル'), 'jane doe__米津玄師&宇多田ヒカル')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ジェヘナ', 'ジェヘナ', (SELECT id FROM artists WHERE normalized_name = 'wotaku feat. 初音ミク'), 'ジェヘナ__wotaku feat. 初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('シカ色デイズ', 'シカ色デイズ', (SELECT id FROM artists WHERE normalized_name = 'シカ部'), 'シカ色デイズ__シカ部')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('Zips', 'zips', (SELECT id FROM artists WHERE normalized_name = 't.m.revolution'), 'zips__t.m.revolution')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('斜陽', '斜陽', (SELECT id FROM artists WHERE normalized_name = 'ヨルシカ'), '斜陽__ヨルシカ')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('車輪の唄', '車輪の唄', (SELECT id FROM artists WHERE normalized_name = 'bump of chicken'), '車輪の唄__bump of chicken')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('シャルル', 'シャルル', (SELECT id FROM artists WHERE normalized_name = 'バルーン feat. v flower'), 'シャルル__バルーン feat. v flower')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ジャンキーナイトタウンオーケストラ', 'ジャンキーナイトタウンオーケストラ', (SELECT id FROM artists WHERE normalized_name = 'すりぃ feat. 鏡音レン'), 'ジャンキーナイトタウンオーケストラ__すりぃ feat. 鏡音レン')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('終焉逃避行', '終焉逃避行', (SELECT id FROM artists WHERE normalized_name = '柊マグネタイト feat. 初音ミク'), '終焉逃避行__柊マグネタイト feat. 初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('十面相', '十面相', (SELECT id FROM artists WHERE normalized_name = 'ym feat. gumi'), '十面相__ym feat. gumi')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('シュガーソングとビターステップ', 'シュガーソングとビターステップ', (SELECT id FROM artists WHERE normalized_name = 'unison square garden'), 'シュガーソングとビターステップ__unison square garden')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('粛聖!! ロリ神レクイエム☆', '粛聖!! ロリ神レクイエム☆', (SELECT id FROM artists WHERE normalized_name = 'しぐれうい'), '粛聖!! ロリ神レクイエム☆__しぐれうい')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('祝福', '祝福', (SELECT id FROM artists WHERE normalized_name = 'yoasobi'), '祝福__yoasobi')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('じょいふる', 'じょいふる', (SELECT id FROM artists WHERE normalized_name = 'いきものがかり'), 'じょいふる__いきものがかり')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('唱', '唱', (SELECT id FROM artists WHERE normalized_name = 'ado'), '唱__ado')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('少女S', '少女s', (SELECT id FROM artists WHERE normalized_name = 'scandal'), '少女s__scandal')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('少女レイ', '少女レイ', (SELECT id FROM artists WHERE normalized_name = 'みきとp feat. 初音ミク'), '少女レイ__みきとp feat. 初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('シル・ヴ・プレジデント', 'シル・ヴ・プレジデント', (SELECT id FROM artists WHERE normalized_name = 'p丸様。'), 'シル・ヴ・プレジデント__p丸様。')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('深海少女', '深海少女', (SELECT id FROM artists WHERE normalized_name = 'ゆうゆ feat.初音ミク'), '深海少女__ゆうゆ feat.初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('Synchrogazer', 'synchrogazer', (SELECT id FROM artists WHERE normalized_name = '水樹奈々'), 'synchrogazer__水樹奈々')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('新時代', '新時代', (SELECT id FROM artists WHERE normalized_name = 'ado'), '新時代__ado')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('シンデレラ', 'シンデレラ', (SELECT id FROM artists WHERE normalized_name = 'deco*27,rockwell feat,初音ミク'), 'シンデレラ__deco*27,rockwell feat,初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('スイートマジック', 'スイートマジック', (SELECT id FROM artists WHERE normalized_name = 'junky feat. 鏡音リン'), 'スイートマジック__junky feat. 鏡音リン')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('彗星ハネムーン', '彗星ハネムーン', (SELECT id FROM artists WHERE normalized_name = 'ナユタン星人 feat. 初音ミク'), '彗星ハネムーン__ナユタン星人 feat. 初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ずうっといっしょ!', 'ずうっといっしょ!', (SELECT id FROM artists WHERE normalized_name = 'キタニタツヤ'), 'ずうっといっしょ!__キタニタツヤ')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('すき、きらい', 'すき、きらい', (SELECT id FROM artists WHERE normalized_name = 'ファントムシータ'), 'すき、きらい__ファントムシータ')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('好きすぎて滅!', '好きすぎて滅!', (SELECT id FROM artists WHERE normalized_name = 'm!lk'), '好きすぎて滅!__m!lk')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('Starry Heavens', 'starry heavens', (SELECT id FROM artists WHERE normalized_name = 'day after tomorrow'), 'starry heavens__day after tomorrow')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ストリーミングハート', 'ストリーミングハート', (SELECT id FROM artists WHERE normalized_name = 'deco*27 feat. 初音ミク'), 'ストリーミングハート__deco*27 feat. 初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('Snow halation', 'snow halation', (SELECT id FROM artists WHERE normalized_name = 'μ''s'), 'snow halation__μ''s')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('スノースマイル', 'スノースマイル', (SELECT id FROM artists WHERE normalized_name = 'bump of chicken'), 'スノースマイル__bump of chicken')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('スピカ', 'スピカ', (SELECT id FROM artists WHERE normalized_name = 'ロクデナ'), 'スピカ__ロクデナ')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('すろぉもぉしょん', 'すろぉもぉしょん', (SELECT id FROM artists WHERE normalized_name = 'ピノキオピー feat. 初音ミク'), 'すろぉもぉしょん__ピノキオピー feat. 初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('星座になれたら', '星座になれたら', (SELECT id FROM artists WHERE normalized_name = '結束バンド'), '星座になれたら__結束バンド')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('青春アミーゴ', '青春アミーゴ', (SELECT id FROM artists WHERE normalized_name = '修二と彰'), '青春アミーゴ__修二と彰')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('青春コンプレックス', '青春コンプレックス', (SELECT id FROM artists WHERE normalized_name = '結束バンド'), '青春コンプレックス__結束バンド')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('sailing day', 'sailing day', (SELECT id FROM artists WHERE normalized_name = 'bump of chicken'), 'sailing day__bump of chicken')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('世界に一つだけの花', '世界に一つだけの花', (SELECT id FROM artists WHERE normalized_name = 'smap'), '世界に一つだけの花__smap')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('世界は恋に落ちている', '世界は恋に落ちている', (SELECT id FROM artists WHERE normalized_name = 'chico with honeyworks'), '世界は恋に落ちている__chico with honeyworks')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('絶頂讃歌', '絶頂讃歌', (SELECT id FROM artists WHERE normalized_name = '和ぬか'), '絶頂讃歌__和ぬか')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('セツナトリップ', 'セツナトリップ', (SELECT id FROM artists WHERE normalized_name = 'last note. feat.gumi'), 'セツナトリップ__last note. feat.gumi')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('セブンティーン', 'セブンティーン', (SELECT id FROM artists WHERE normalized_name = 'yoasobi'), 'セブンティーン__yoasobi')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('セレナーデ', 'セレナーデ', (SELECT id FROM artists WHERE normalized_name = 'なとり'), 'セレナーデ__なとり')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('前前前世', '前前前世', (SELECT id FROM artists WHERE normalized_name = 'radwimps'), '前前前世__radwimps')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('千本桜', '千本桜', (SELECT id FROM artists WHERE normalized_name = '黒うさp feat.初音ミク'), '千本桜__黒うさp feat.初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('相思相愛', '相思相愛', (SELECT id FROM artists WHERE normalized_name = 'aiko'), '相思相愛__aiko')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('創聖のアクエリオン', '創聖のアクエリオン', (SELECT id FROM artists WHERE normalized_name = 'akino'), '創聖のアクエリオン__akino')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ゾクゾク', 'ゾクゾク', (SELECT id FROM artists WHERE normalized_name = 'ファントムシータ'), 'ゾクゾク__ファントムシータ')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('そして僕にできるコト', 'そして僕にできるコト', (SELECT id FROM artists WHERE normalized_name = 'day after tomorrow'), 'そして僕にできるコト__day after tomorrow')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('そばかす', 'そばかす', (SELECT id FROM artists WHERE normalized_name = 'judy and mary'), 'そばかす__judy and mary')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('空も飛べるはず', '空も飛べるはず', (SELECT id FROM artists WHERE normalized_name = 'スピッツ'), '空も飛べるはず__スピッツ')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('それは小さな光のような', 'それは小さな光のような', (SELECT id FROM artists WHERE normalized_name = 'さユり'), 'それは小さな光のような__さユり')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ダーリン', 'ダーリン', (SELECT id FROM artists WHERE normalized_name = '須田景凪'), 'ダーリン__須田景凪')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ダーリン', 'ダーリン', (SELECT id FROM artists WHERE normalized_name = 'mrs. green apple'), 'ダーリン__mrs. green apple')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ダーリンダンス', 'ダーリンダンス', (SELECT id FROM artists WHERE normalized_name = 'かいりきベア feat.初音ミク'), 'ダーリンダンス__かいりきベア feat.初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('大切なもの', '大切なもの', (SELECT id FROM artists WHERE normalized_name = 'ロードオブメジャー'), '大切なもの__ロードオブメジャー')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ダイダイダイダイダイキライ', 'ダイダイダイダイダイキライ', (SELECT id FROM artists WHERE normalized_name = '雨良(amala) feat. 初音ミク,重音テト'), 'ダイダイダイダイダイキライ__雨良(amala) feat. 初音ミク,重音テト')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('TAIDADA', 'taidada', (SELECT id FROM artists WHERE normalized_name = 'ずっと真夜中でいいのに。'), 'taidada__ずっと真夜中でいいのに。')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('第六感', '第六感', (SELECT id FROM artists WHERE normalized_name = 'reol'), '第六感__reol')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('だから僕は音楽を辞めた', 'だから僕は音楽を辞めた', (SELECT id FROM artists WHERE normalized_name = 'ヨルシカ'), 'だから僕は音楽を辞めた__ヨルシカ')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('竹取オーバーナイトセンセーション', '竹取オーバーナイトセンセーション', (SELECT id FROM artists WHERE normalized_name = 'honeyworks feat.鏡音リン,鏡音レン'), '竹取オーバーナイトセンセーション__honeyworks feat.鏡音リン,鏡音レン')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ただ君に晴れ', 'ただ君に晴れ', (SELECT id FROM artists WHERE normalized_name = 'ヨルシカ'), 'ただ君に晴れ__ヨルシカ')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('正しくなれない', '正しくなれない', (SELECT id FROM artists WHERE normalized_name = 'ずっと真夜中でいいのに。'), '正しくなれない__ずっと真夜中でいいのに。')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('脱法ロック', '脱法ロック', (SELECT id FROM artists WHERE normalized_name = 'neru feat. 鏡音レン'), '脱法ロック__neru feat. 鏡音レン')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('魂のルフラン', '魂のルフラン', (SELECT id FROM artists WHERE normalized_name = '高橋洋子'), '魂のルフラン__高橋洋子')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('タマシイレボリューション', 'タマシイレボリューション', (SELECT id FROM artists WHERE normalized_name = 'superfly'), 'タマシイレボリューション__superfly')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('DARMA GRAND PRIX', 'darma grand prix', (SELECT id FROM artists WHERE normalized_name = 'radwimps'), 'darma grand prix__radwimps')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('だれかの心臓になれたなら', 'だれかの心臓になれたなら', (SELECT id FROM artists WHERE normalized_name = 'ユリイ・カノン feat. gumi'), 'だれかの心臓になれたなら__ユリイ・カノン feat. gumi')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('DAN DAN 心魅かれてく', 'dan dan 心魅かれてく', (SELECT id FROM artists WHERE normalized_name = 'field of view'), 'dan dan 心魅かれてく__field of view')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ダンシング・ヒーロー(Eat You Up)', 'ダンシング・ヒーロー(eat you up)', (SELECT id FROM artists WHERE normalized_name = '荻野目洋子'), 'ダンシング・ヒーロー(eat you up)__荻野目洋子')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('小さな恋のうた', '小さな恋のうた', (SELECT id FROM artists WHERE normalized_name = 'mongol800'), '小さな恋のうた__mongol800')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('チェリー', 'チェリー', (SELECT id FROM artists WHERE normalized_name = 'スピッツ'), 'チェリー__スピッツ')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('CHE.R.RY', 'che.r.ry', (SELECT id FROM artists WHERE normalized_name = 'yui'), 'che.r.ry__yui')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('チェリーポップ', 'チェリーポップ', (SELECT id FROM artists WHERE normalized_name = 'deco*27 feat. 初音ミク'), 'チェリーポップ__deco*27 feat. 初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('地球最後の告白を', '地球最後の告白を', (SELECT id FROM artists WHERE normalized_name = 'kemu feat.gumi'), '地球最後の告白を__kemu feat.gumi')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('チャンカパーナ', 'チャンカパーナ', (SELECT id FROM artists WHERE normalized_name = 'news'), 'チャンカパーナ__news')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ちゅ、多様性。', 'ちゅ、多様性。', (SELECT id FROM artists WHERE normalized_name = 'ano'), 'ちゅ、多様性。__ano')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('チュルリラ・チュルリラ・ダッダッダ!', 'チュルリラ・チュルリラ・ダッダッダ!', (SELECT id FROM artists WHERE normalized_name = '和田たけあき(くらげp) feat. 結月ゆかり'), 'チュルリラ・チュルリラ・ダッダッダ!__和田たけあき(くらげp) feat. 結月ゆかり')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('超主人公', '超主人公', (SELECT id FROM artists WHERE normalized_name = 'ピノキオピー feat. 初音ミク'), '超主人公__ピノキオピー feat. 初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('超絶かわいい', '超絶かわいい', (SELECT id FROM artists WHERE normalized_name = 'mona(cv.夏川椎菜) feat.honeyworks'), '超絶かわいい__mona(cv.夏川椎菜) feat.honeyworks')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('チョコレイト・ディスコ', 'チョコレイト・ディスコ', (SELECT id FROM artists WHERE normalized_name = 'perfume'), 'チョコレイト・ディスコ__perfume')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('チョコレートメランコリー', 'チョコレートメランコリー', (SELECT id FROM artists WHERE normalized_name = '≠me'), 'チョコレートメランコリー__≠me')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('月と花束', '月と花束', (SELECT id FROM artists WHERE normalized_name = 'さユり'), '月と花束__さユり')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('T氏の話を信じるな', 't氏の話を信じるな', (SELECT id FROM artists WHERE normalized_name = 'ピノキオピー feat. 初音ミク,重音テト'), 't氏の話を信じるな__ピノキオピー feat. 初音ミク,重音テト')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('TT', 'tt', (SELECT id FROM artists WHERE normalized_name = 'twice'), 'tt__twice')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('手紙~拝啓十五の君へ~', '手紙~拝啓十五の君へ~', (SELECT id FROM artists WHERE normalized_name = 'アンジェラ・アキ'), '手紙~拝啓十五の君へ~__アンジェラ・アキ')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('TEST ME', 'test me', (SELECT id FROM artists WHERE normalized_name = 'ちゃんみな'), 'test me__ちゃんみな')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('テトリス', 'テトリス', (SELECT id FROM artists WHERE normalized_name = '柊マグネタイト feat. 重音テト'), 'テトリス__柊マグネタイト feat. 重音テト')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('デビルじゃないもん', 'デビルじゃないもん', (SELECT id FROM artists WHERE normalized_name = 'deco*27,ピノキオピー feat. 初音ミク'), 'デビルじゃないもん__deco*27,ピノキオピー feat. 初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('Tell Your World', 'tell your world', (SELECT id FROM artists WHERE normalized_name = 'livetune feat.初音ミク'), 'tell your world__livetune feat.初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('テレキャスタービーボーイ', 'テレキャスタービーボーイ', (SELECT id FROM artists WHERE normalized_name = 'すりぃ feat. 鏡音レン'), 'テレキャスタービーボーイ__すりぃ feat. 鏡音レン')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('テレパシ', 'テレパシ', (SELECT id FROM artists WHERE normalized_name = 'deco*27 feat. 初音ミク'), 'テレパシ__deco*27 feat. 初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('天樂', '天樂', (SELECT id FROM artists WHERE normalized_name = 'ゆうゆ feat. 鏡音リン'), '天樂__ゆうゆ feat. 鏡音リン')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('転生林檎', '転生林檎', (SELECT id FROM artists WHERE normalized_name = 'ピノキオピー feat. 初音ミク'), '転生林檎__ピノキオピー feat. 初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('天体観測', '天体観測', (SELECT id FROM artists WHERE normalized_name = 'bump of chicken'), '天体観測__bump of chicken')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('トウキョウ・シャンディ・ランデヴ', 'トウキョウ・シャンディ・ランデヴ', (SELECT id FROM artists WHERE normalized_name = 'feat. 花譜,ツミキ/maisondes'), 'トウキョウ・シャンディ・ランデヴ__feat. 花譜,ツミキ/maisondes')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('東京テディベア', '東京テディベア', (SELECT id FROM artists WHERE normalized_name = 'neru feat. 鏡音リン'), '東京テディベア__neru feat. 鏡音リン')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('truth', 'truth', (SELECT id FROM artists WHERE normalized_name = '嵐'), 'truth__嵐')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ドーナツホール', 'ドーナツホール', (SELECT id FROM artists WHERE normalized_name = 'ハチ feat. gumi'), 'ドーナツホール__ハチ feat. gumi')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ド屑', 'ド屑', (SELECT id FROM artists WHERE normalized_name = 'なきそ feat.歌愛ユキ'), 'ド屑__なきそ feat.歌愛ユキ')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('とくべチュ、して', 'とくべチュ、して', (SELECT id FROM artists WHERE normalized_name = '=love'), 'とくべチュ、して__=love')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ドミノ倒シ', 'ドミノ倒シ', (SELECT id FROM artists WHERE normalized_name = 'すこっぷ feat. 初音ミク'), 'ドミノ倒シ__すこっぷ feat. 初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ドライフラワー', 'ドライフラワー', (SELECT id FROM artists WHERE normalized_name = '優里'), 'ドライフラワー__優里')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('トリノコシティ', 'トリノコシティ', (SELECT id FROM artists WHERE normalized_name = '40mp feat. 初音ミク'), 'トリノコシティ__40mp feat. 初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('トレモロ', 'トレモロ', (SELECT id FROM artists WHERE normalized_name = 'radwimps'), 'トレモロ__radwimps')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('夏色', '夏色', (SELECT id FROM artists WHERE normalized_name = 'ゆず'), '夏色__ゆず')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('夏祭り', '夏祭り', (SELECT id FROM artists WHERE normalized_name = 'jitterin''jinn(cover whiteberry)'), '夏祭り__jitterin''jinn(cover whiteberry)')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('名前のない怪物', '名前のない怪物', (SELECT id FROM artists WHERE normalized_name = 'egoist'), '名前のない怪物__egoist')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('何度でも', '何度でも', (SELECT id FROM artists WHERE normalized_name = 'dreams come true'), '何度でも__dreams come true')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('人間E判定', '人間e判定', (SELECT id FROM artists WHERE normalized_name = 'ヨーメイ'), '人間e判定__ヨーメイ')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('にんじゃりばんばん', 'にんじゃりばんばん', (SELECT id FROM artists WHERE normalized_name = 'きゃりーぱみゅぱみゅ'), 'にんじゃりばんばん__きゃりーぱみゅぱみゅ')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('寝起きヤシの木', '寝起きヤシの木', (SELECT id FROM artists WHERE normalized_name = 'yukopi feat. 歌愛ユキ'), '寝起きヤシの木__yukopi feat. 歌愛ユキ')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('脳漿炸裂ガール', '脳漿炸裂ガール', (SELECT id FROM artists WHERE normalized_name = 'れるりり feat.初音ミク,gumi'), '脳漿炸裂ガール__れるりり feat.初音ミク,gumi')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('脳裏上のクラッカー', '脳裏上のクラッカー', (SELECT id FROM artists WHERE normalized_name = 'ずっと真夜中でいいのに。'), '脳裏上のクラッカー__ずっと真夜中でいいのに。')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ノンブレス・オブリージュ', 'ノンブレス・オブリージュ', (SELECT id FROM artists WHERE normalized_name = 'ピノキオピー feat. 初音ミク'), 'ノンブレス・オブリージュ__ピノキオピー feat. 初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('birthday song', 'birthday song', (SELECT id FROM artists WHERE normalized_name = 'さユり'), 'birthday song__さユり')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('はいよろこんで', 'はいよろこんで', (SELECT id FROM artists WHERE normalized_name = 'こっちのけんと'), 'はいよろこんで__こっちのけんと')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('バグ', 'バグ', (SELECT id FROM artists WHERE normalized_name = 'かいりきベア feat.初音ミク'), 'バグ__かいりきベア feat.初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('白日', '白日', (SELECT id FROM artists WHERE normalized_name = 'king gnu'), '白日__king gnu')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('爆裂愛してる', '爆裂愛してる', (SELECT id FROM artists WHERE normalized_name = 'm!lk'), '爆裂愛してる__m!lk')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('パジャマパーティーズのうた', 'パジャマパーティーズのうた', (SELECT id FROM artists WHERE normalized_name = 'パジャマパーティーズ'), 'パジャマパーティーズのうた__パジャマパーティーズ')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('Butter-Fly', 'butter-fly', (SELECT id FROM artists WHERE normalized_name = '和田光司'), 'butter-fly__和田光司')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ハッピーシンセサイザ', 'ハッピーシンセサイザ', (SELECT id FROM artists WHERE normalized_name = 'easy pop feat.巡音ルカ,gumi'), 'ハッピーシンセサイザ__easy pop feat.巡音ルカ,gumi')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('Happy Halloween', 'happy halloween', (SELECT id FROM artists WHERE normalized_name = 'junky feat. 鏡音リン'), 'happy halloween__junky feat. 鏡音リン')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('花になって', '花になって', (SELECT id FROM artists WHERE normalized_name = '緑黄色社会'), '花になって__緑黄色社会')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('花に亡霊', '花に亡霊', (SELECT id FROM artists WHERE normalized_name = 'ヨルシカ'), '花に亡霊__ヨルシカ')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('花の塔', '花の塔', (SELECT id FROM artists WHERE normalized_name = 'さユり'), '花の塔__さユり')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('HANABI', 'hanabi', (SELECT id FROM artists WHERE normalized_name = 'mr.children'), 'hanabi__mr.children')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('はなまるぴっぴはよいこだけ', 'はなまるぴっぴはよいこだけ', (SELECT id FROM artists WHERE normalized_name = 'a応p'), 'はなまるぴっぴはよいこだけ__a応p')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ハナミズキ', 'ハナミズキ', (SELECT id FROM artists WHERE normalized_name = '一青窈'), 'ハナミズキ__一青窈')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('Happiness', 'happiness', (SELECT id FROM artists WHERE normalized_name = '嵐'), 'happiness__嵐')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('Ham', 'ham', (SELECT id FROM artists WHERE normalized_name = 'ずっと真夜中でいいのに。'), 'ham__ずっと真夜中でいいのに。')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ハム太郎 とっとこうた', 'ハム太郎 とっとこうた', (SELECT id FROM artists WHERE normalized_name = 'ハムちゃんず'), 'ハム太郎 とっとこうた__ハムちゃんず')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('晴る', '晴る', (SELECT id FROM artists WHERE normalized_name = 'ヨルシカ'), '晴る__ヨルシカ')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ハルカ', 'ハルカ', (SELECT id FROM artists WHERE normalized_name = 'yoasobi'), 'ハルカ__yoasobi')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ハルジオン', 'ハルジオン', (SELECT id FROM artists WHERE normalized_name = 'yoasobi'), 'ハルジオン__yoasobi')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ハレ晴レユカイ', 'ハレ晴レユカイ', (SELECT id FROM artists WHERE normalized_name = '涼宮ハルヒ(cv.平野綾),長門有希(cv.茅原実里),朝比奈みくる(cv.後藤邑子)'), 'ハレ晴レユカイ__涼宮ハルヒ(cv.平野綾),長門有希(cv.茅原実里),朝比奈みくる(cv.後藤邑子)')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ハレンチ', 'ハレンチ', (SELECT id FROM artists WHERE normalized_name = 'ちゃんみな'), 'ハレンチ__ちゃんみな')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('Hello,Again~昔からある場所~', 'hello,again~昔からある場所~', (SELECT id FROM artists WHERE normalized_name = 'my little lover'), 'hello,again~昔からある場所~__my little lover')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('晩餐歌', '晩餐歌', (SELECT id FROM artists WHERE normalized_name = 'tuki.'), '晩餐歌__tuki.')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('パンダヒーロー', 'パンダヒーロー', (SELECT id FROM artists WHERE normalized_name = 'ハチ feat. gumi'), 'パンダヒーロー__ハチ feat. gumi')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ピースサイン', 'ピースサイン', (SELECT id FROM artists WHERE normalized_name = '米津玄師'), 'ピースサイン__米津玄師')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('Bのリベンジ', 'bのリベンジ', (SELECT id FROM artists WHERE normalized_name = 'b小町'), 'bのリベンジ__b小町')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ヒカリへ', 'ヒカリへ', (SELECT id FROM artists WHERE normalized_name = 'miwa'), 'ヒカリへ__miwa')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('美少女無罪♡パイレーツ', '美少女無罪♡パイレーツ', (SELECT id FROM artists WHERE normalized_name = '宝鐘マリン'), '美少女無罪♡パイレーツ__宝鐘マリン')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ヒッチコック', 'ヒッチコック', (SELECT id FROM artists WHERE normalized_name = 'ヨルシカ'), 'ヒッチコック__ヨルシカ')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('人マニア', '人マニア', (SELECT id FROM artists WHERE normalized_name = '原口沙輔 feat. 重音テト'), '人マニア__原口沙輔 feat. 重音テト')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ひとりごつ', 'ひとりごつ', (SELECT id FROM artists WHERE normalized_name = 'ハチワレ(cv.田中誠人)'), 'ひとりごつ__ハチワレ(cv.田中誠人)')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('独りんぼエンヴィー', '独りんぼエンヴィー', (SELECT id FROM artists WHERE normalized_name = 'koyori(電ポルp) feat.初音ミク'), '独りんぼエンヴィー__koyori(電ポルp) feat.初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ヒバナ', 'ヒバナ', (SELECT id FROM artists WHERE normalized_name = 'deco*27 feat. 初音ミク'), 'ヒバナ__deco*27 feat. 初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ヒビカセ', 'ヒビカセ', (SELECT id FROM artists WHERE normalized_name = 'ギガp feat. 初音ミク'), 'ヒビカセ__ギガp feat. 初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ビビっとラブ', 'ビビっとラブ', (SELECT id FROM artists WHERE normalized_name = 'chico with honeyworks meets まふまふ'), 'ビビっとラブ__chico with honeyworks meets まふまふ')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ビビデバ', 'ビビデバ', (SELECT id FROM artists WHERE normalized_name = '星街すいせい'), 'ビビデバ__星街すいせい')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('Beautiful World', 'beautiful world', (SELECT id FROM artists WHERE normalized_name = '宇多田ヒカル'), 'beautiful world__宇多田ヒカル')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ヒューマノイド', 'ヒューマノイド', (SELECT id FROM artists WHERE normalized_name = 'ずっと真夜中でいいのに。'), 'ヒューマノイド__ずっと真夜中でいいのに。')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ひゅるりらぱっぱ', 'ひゅるりらぱっぱ', (SELECT id FROM artists WHERE normalized_name = 'tuki.'), 'ひゅるりらぱっぱ__tuki.')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('秒針を噛む', '秒針を噛む', (SELECT id FROM artists WHERE normalized_name = 'ずっと真夜中でいいのに。'), '秒針を噛む__ずっと真夜中でいいのに。')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('Believe', 'believe', (SELECT id FROM artists WHERE normalized_name = 'folder5'), 'believe__folder5')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ヒロイン育成計画', 'ヒロイン育成計画', (SELECT id FROM artists WHERE normalized_name = 'feat. 涼海ひより(cv.水瀬いのり)/honeyworks'), 'ヒロイン育成計画__feat. 涼海ひより(cv.水瀬いのり)/honeyworks')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('First Love', 'first love', (SELECT id FROM artists WHERE normalized_name = '宇多田ヒカル'), 'first love__宇多田ヒカル')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ファタール', 'ファタール', (SELECT id FROM artists WHERE normalized_name = 'gemn'), 'ファタール__gemn')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ファンサ', 'ファンサ', (SELECT id FROM artists WHERE normalized_name = 'mona(cv.夏川椎菜) feat.honeyworks'), 'ファンサ__mona(cv.夏川椎菜) feat.honeyworks')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('フォニイ', 'フォニイ', (SELECT id FROM artists WHERE normalized_name = 'ツミキ feat. 可不'), 'フォニイ__ツミキ feat. 可不')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('不協和音', '不協和音', (SELECT id FROM artists WHERE normalized_name = '欅坂46'), '不協和音__欅坂46')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ふたりごと', 'ふたりごと', (SELECT id FROM artists WHERE normalized_name = 'radwimps'), 'ふたりごと__radwimps')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('フライングゲット', 'フライングゲット', (SELECT id FROM artists WHERE normalized_name = 'akb48'), 'フライングゲット__akb48')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('Plazma', 'plazma', (SELECT id FROM artists WHERE normalized_name = '米津玄師'), 'plazma__米津玄師')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('FLAGS', 'flags', (SELECT id FROM artists WHERE normalized_name = 't.m.revolution'), 'flags__t.m.revolution')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('プラネタリウム', 'プラネタリウム', (SELECT id FROM artists WHERE normalized_name = '大塚愛'), 'プラネタリウム__大塚愛')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('Flamingo', 'flamingo', (SELECT id FROM artists WHERE normalized_name = '米津玄師'), 'flamingo__米津玄師')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('フラレガイガール', 'フラレガイガール', (SELECT id FROM artists WHERE normalized_name = 'さユり'), 'フラレガイガール__さユり')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ブリキノダンス', 'ブリキノダンス', (SELECT id FROM artists WHERE normalized_name = '日向電工 feat. 初音ミク'), 'ブリキノダンス__日向電工 feat. 初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('Preserved Roses', 'preserved roses', (SELECT id FROM artists WHERE normalized_name = 't.m.revolution×水樹奈々'), 'preserved roses__t.m.revolution×水樹奈々')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('Pretender', 'pretender', (SELECT id FROM artists WHERE normalized_name = 'official髭男dism'), 'pretender__official髭男dism')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('Bling-Bang-Bang-Born', 'bling-bang-bang-born', (SELECT id FROM artists WHERE normalized_name = 'creepy nuts'), 'bling-bang-bang-born__creepy nuts')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ブルーバード', 'ブルーバード', (SELECT id FROM artists WHERE normalized_name = 'いきものがかり'), 'ブルーバード__いきものがかり')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ブルーベリー・ナイツ', 'ブルーベリー・ナイツ', (SELECT id FROM artists WHERE normalized_name = 'マカロニえんぴつ'), 'ブルーベリー・ナイツ__マカロニえんぴつ')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('プロポーズ', 'プロポーズ', (SELECT id FROM artists WHERE normalized_name = 'なとり'), 'プロポーズ__なとり')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('平行線', '平行線', (SELECT id FROM artists WHERE normalized_name = 'さユり'), '平行線__さユり')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('Best Friend', 'best friend', (SELECT id FROM artists WHERE normalized_name = '西野カナ'), 'best friend__西野カナ')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ベテルギウス', 'ベテルギウス', (SELECT id FROM artists WHERE normalized_name = '優里'), 'ベテルギウス__優里')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ベノム', 'ベノム', (SELECT id FROM artists WHERE normalized_name = 'かいりきベア feat. v flower'), 'ベノム__かいりきベア feat. v flower')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ヘビーローテーション', 'ヘビーローテーション', (SELECT id FROM artists WHERE normalized_name = 'akb48'), 'ヘビーローテーション__akb48')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('亡國覚醒カタルシス', '亡國覚醒カタルシス', (SELECT id FROM artists WHERE normalized_name = 'ali project'), '亡國覚醒カタルシス__ali project')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('誇り高きアイドル', '誇り高きアイドル', (SELECT id FROM artists WHERE normalized_name = 'honey works feat. kotoha'), '誇り高きアイドル__honey works feat. kotoha')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('星降る海', '星降る海', (SELECT id FROM artists WHERE normalized_name = 'aqu3ra,月見ヤチヨ(cv.早見沙織)'), '星降る海__aqu3ra,月見ヤチヨ(cv.早見沙織)')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('HOT LIMIT', 'hot limit', (SELECT id FROM artists WHERE normalized_name = 't.m.revolution'), 'hot limit__t.m.revolution')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('botばっか', 'botばっか', (SELECT id FROM artists WHERE normalized_name = 'ファントムシータ'), 'botばっか__ファントムシータ')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('POP IN 2', 'pop in 2', (SELECT id FROM artists WHERE normalized_name = 'b小町'), 'pop in 2__b小町')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ポニーテールとシュシュ', 'ポニーテールとシュシュ', (SELECT id FROM artists WHERE normalized_name = 'akb48'), 'ポニーテールとシュシュ__akb48')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('微笑みの爆弾', '微笑みの爆弾', (SELECT id FROM artists WHERE normalized_name = '馬渡松子'), '微笑みの爆弾__馬渡松子')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('炎', '炎', (SELECT id FROM artists WHERE normalized_name = 'lisa'), '炎__lisa')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('WHITE BREATH', 'white breath', (SELECT id FROM artists WHERE normalized_name = 't.m.revolution'), 'white breath__t.m.revolution')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('White Love', 'white love', (SELECT id FROM artists WHERE normalized_name = 'speed'), 'white love__speed')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('PON PON PON', 'pon pon pon', (SELECT id FROM artists WHERE normalized_name = 'きゃりーぱみゅぱみゅ'), 'pon pon pon__きゃりーぱみゅぱみゅ')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('本能', '本能', (SELECT id FROM artists WHERE normalized_name = '椎名林檎'), '本能__椎名林檎')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('マーシャル・マキシマイザー', 'マーシャル・マキシマイザー', (SELECT id FROM artists WHERE normalized_name = '柊マグネタイト feat. 可不'), 'マーシャル・マキシマイザー__柊マグネタイト feat. 可不')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('負けないで', '負けないで', (SELECT id FROM artists WHERE normalized_name = 'zard'), '負けないで__zard')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('マシュマロ', 'マシュマロ', (SELECT id FROM artists WHERE normalized_name = 'deco*27 feat. 初音ミク'), 'マシュマロ__deco*27 feat. 初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('魔弾', '魔弾', (SELECT id FROM artists WHERE normalized_name = 't.m.revolution'), '魔弾__t.m.revolution')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('真っ赤な空を見ただろうか', '真っ赤な空を見ただろうか', (SELECT id FROM artists WHERE normalized_name = 'bump of chicken'), '真っ赤な空を見ただろうか__bump of chicken')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('マトリョシカ', 'マトリョシカ', (SELECT id FROM artists WHERE normalized_name = 'ハチ feat.初音ミク,gumi'), 'マトリョシカ__ハチ feat.初音ミク,gumi')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('魔法少女とチョコレゐト', '魔法少女とチョコレゐト', (SELECT id FROM artists WHERE normalized_name = 'ピノキオピー feat. 初音ミク'), '魔法少女とチョコレゐト__ピノキオピー feat. 初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('丸の内サディスティック', '丸の内サディスティック', (SELECT id FROM artists WHERE normalized_name = '椎名林檎'), '丸の内サディスティック__椎名林檎')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('回る空うさぎ', '回る空うさぎ', (SELECT id FROM artists WHERE normalized_name = 'orangestar feat. 初音ミク'), '回る空うさぎ__orangestar feat. 初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('Meteor -ミーティア-', 'meteor -ミーティア-', (SELECT id FROM artists WHERE normalized_name = 't.m.revolution'), 'meteor -ミーティア-__t.m.revolution')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ミカヅキ', 'ミカヅキ', (SELECT id FROM artists WHERE normalized_name = 'さユり'), 'ミカヅキ__さユり')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('右肩の蝶', '右肩の蝶', (SELECT id FROM artists WHERE normalized_name = 'のりぴー feat. 鏡音レン'), '右肩の蝶__のりぴー feat. 鏡音レン')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ミックスナッツ', 'ミックスナッツ', (SELECT id FROM artists WHERE normalized_name = 'official髭男dism'), 'ミックスナッツ__official髭男dism')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('みむかゥわナイストライ', 'みむかゥわナイストライ', (SELECT id FROM artists WHERE normalized_name = 'ぬぬぬぬぬぬぬぬぬぬぬぬぬぬぬぬ feat. 初音ミク'), 'みむかゥわナイストライ__ぬぬぬぬぬぬぬぬぬぬぬぬぬぬぬぬ feat. 初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ミュージック・アワー', 'ミュージック・アワー', (SELECT id FROM artists WHERE normalized_name = 'ポルノグラフィティ'), 'ミュージック・アワー__ポルノグラフィティ')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ムーンライト伝説', 'ムーンライト伝説', (SELECT id FROM artists WHERE normalized_name = 'dali'), 'ムーンライト伝説__dali')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ム責任集合体', 'ム責任集合体', (SELECT id FROM artists WHERE normalized_name = 'マサラダ feat. 重音テト'), 'ム責任集合体__マサラダ feat. 重音テト')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('めざせポケモンマスター', 'めざせポケモンマスター', (SELECT id FROM artists WHERE normalized_name = '松本 梨香'), 'めざせポケモンマスター__松本 梨香')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('メフィスト', 'メフィスト', (SELECT id FROM artists WHERE normalized_name = '女王蜂'), 'メフィスト__女王蜂')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('女々しくて', '女々しくて', (SELECT id FROM artists WHERE normalized_name = 'ゴールデンボンバー'), '女々しくて__ゴールデンボンバー')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('Mela!', 'mela!', (SELECT id FROM artists WHERE normalized_name = '緑黄色社会'), 'mela!__緑黄色社会')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('メランコリーキッチン', 'メランコリーキッチン', (SELECT id FROM artists WHERE normalized_name = '米津玄師'), 'メランコリーキッチン__米津玄師')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('メランコリック', 'メランコリック', (SELECT id FROM artists WHERE normalized_name = 'junky feat.鏡音リン'), 'メランコリック__junky feat.鏡音リン')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('メリクリ', 'メリクリ', (SELECT id FROM artists WHERE normalized_name = 'boa'), 'メリクリ__boa')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('メリュー', 'メリュー', (SELECT id FROM artists WHERE normalized_name = 'n-buna feat. 初音ミク'), 'メリュー__n-buna feat. 初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('メルト', 'メルト', (SELECT id FROM artists WHERE normalized_name = 'ryo(supercell) feat. 初音ミク'), 'メルト__ryo(supercell) feat. 初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('メルト CPK! Remix', 'メルト cpk! remix', (SELECT id FROM artists WHERE normalized_name = 'ryo (supercell) feat.かぐや(cv.夏吉ゆうこ)'), 'メルト cpk! remix__ryo (supercell) feat.かぐや(cv.夏吉ゆうこ)')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('メンタルチェンソー', 'メンタルチェンソー', (SELECT id FROM artists WHERE normalized_name = 'p丸様。'), 'メンタルチェンソー__p丸様。')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('妄想感傷代償連盟', '妄想感傷代償連盟', (SELECT id FROM artists WHERE normalized_name = 'deco*27 feat. 初音ミク'), '妄想感傷代償連盟__deco*27 feat. 初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('妄想疾患■ガール', '妄想疾患■ガール', (SELECT id FROM artists WHERE normalized_name = 'もじゃ,れるりり feat. gumi'), '妄想疾患■ガール__もじゃ,れるりり feat. gumi')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('妄想税', '妄想税', (SELECT id FROM artists WHERE normalized_name = 'deco*27 feat. 初音ミク'), '妄想税__deco*27 feat. 初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('目撃!テト31世', '目撃!テト31世', (SELECT id FROM artists WHERE normalized_name = 'はろける feat. 雨衣,重音テト'), '目撃!テト31世__はろける feat. 雨衣,重音テト')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('モザイクカケラ', 'モザイクカケラ', (SELECT id FROM artists WHERE normalized_name = 'sunset swish'), 'モザイクカケラ__sunset swish')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('モザイクロール', 'モザイクロール', (SELECT id FROM artists WHERE normalized_name = 'deco*27 feat. gumi'), 'モザイクロール__deco*27 feat. gumi')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('モニタリング', 'モニタリング', (SELECT id FROM artists WHERE normalized_name = 'deco*27 feat. 初音ミク'), 'モニタリング__deco*27 feat. 初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('Monster', 'monster', (SELECT id FROM artists WHERE normalized_name = '嵐'), 'monster__嵐')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('やさしさで溢れるように', 'やさしさで溢れるように', (SELECT id FROM artists WHERE normalized_name = 'juju'), 'やさしさで溢れるように__juju')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('勇者', '勇者', (SELECT id FROM artists WHERE normalized_name = 'yoasobi'), '勇者__yoasobi')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('有心論', '有心論', (SELECT id FROM artists WHERE normalized_name = 'radwimps'), '有心論__radwimps')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('幽霊東京', '幽霊東京', (SELECT id FROM artists WHERE normalized_name = 'ayase feat. 初音ミク'), '幽霊東京__ayase feat. 初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('雪だるまつくろう', '雪だるまつくろう', (SELECT id FROM artists WHERE normalized_name = '神田沙也加,稲葉菜月,諸星すみれ'), '雪だるまつくろう__神田沙也加,稲葉菜月,諸星すみれ')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('雪の華', '雪の華', (SELECT id FROM artists WHERE normalized_name = '中島美嘉'), '雪の華__中島美嘉')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('夜明けと蛍', '夜明けと蛍', (SELECT id FROM artists WHERE normalized_name = 'n-buna feat.初音ミク'), '夜明けと蛍__n-buna feat.初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('酔いどれ知らず', '酔いどれ知らず', (SELECT id FROM artists WHERE normalized_name = 'kanaria feat. gumi'), '酔いどれ知らず__kanaria feat. gumi')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('吉原ラメント', '吉原ラメント', (SELECT id FROM artists WHERE normalized_name = '亜沙 feat.重音テト'), '吉原ラメント__亜沙 feat.重音テト')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('夜もすがら君想ふ', '夜もすがら君想ふ', (SELECT id FROM artists WHERE normalized_name = 'tokotoko(西沢さんp) feat. gumi'), '夜もすがら君想ふ__tokotoko(西沢さんp) feat. gumi')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('夜に駆ける', '夜に駆ける', (SELECT id FROM artists WHERE normalized_name = 'yoasobi'), '夜に駆ける__yoasobi')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('夜の踊り子', '夜の踊り子', (SELECT id FROM artists WHERE normalized_name = 'サカナクション'), '夜の踊り子__サカナクション')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('弱虫モンブラン', '弱虫モンブラン', (SELECT id FROM artists WHERE normalized_name = 'deco*27 feat. gumi'), '弱虫モンブラン__deco*27 feat. gumi')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ライアーダンサー', 'ライアーダンサー', (SELECT id FROM artists WHERE normalized_name = 'マサラダ feat. 重音テト'), 'ライアーダンサー__マサラダ feat. 重音テト')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ライオン', 'ライオン', (SELECT id FROM artists WHERE normalized_name = 'may''n,中島 愛'), 'ライオン__may''n,中島 愛')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('来世で会おう', '来世で会おう', (SELECT id FROM artists WHERE normalized_name = 'さユり'), '来世で会おう__さユり')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ライラック', 'ライラック', (SELECT id FROM artists WHERE normalized_name = 'mrs. green apple'), 'ライラック__mrs. green apple')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ラヴィ', 'ラヴィ', (SELECT id FROM artists WHERE normalized_name = 'すりぃ feat,鏡音レン'), 'ラヴィ__すりぃ feat,鏡音レン')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ラズベリー*モンスター', 'ラズベリー*モンスター', (SELECT id FROM artists WHERE normalized_name = 'honeyworks feat. 初音ミク'), 'ラズベリー*モンスター__honeyworks feat. 初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('Love so sweet', 'love so sweet', (SELECT id FROM artists WHERE normalized_name = '嵐'), 'love so sweet__嵐')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ラフ・メイカー', 'ラフ・メイカー', (SELECT id FROM artists WHERE normalized_name = 'bump of chicken'), 'ラフ・メイカー__bump of chicken')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ラブカ?', 'ラブカ?', (SELECT id FROM artists WHERE normalized_name = '柊キライ feat. v flower'), 'ラブカ?__柊キライ feat. v flower')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ラブチーノ', 'ラブチーノ', (SELECT id FROM artists WHERE normalized_name = 'junky feat. 鏡音リン'), 'ラブチーノ__junky feat. 鏡音リン')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('Reason', 'reason', (SELECT id FROM artists WHERE normalized_name = '玉置成実'), 'reason__玉置成実')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('リードコントロール', 'リードコントロール', (SELECT id FROM artists WHERE normalized_name = 'なるみや'), 'リードコントロール__なるみや')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('Remember', 'remember', (SELECT id FROM artists WHERE normalized_name = 'yuigot,月見ヤチヨ(cv.早見沙織)'), 'remember__yuigot,月見ヤチヨ(cv.早見沙織)')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ルカルカ★ナイトフィーバー', 'ルカルカ★ナイトフィーバー', (SELECT id FROM artists WHERE normalized_name = 'samfree feat. 巡音ルカ'), 'ルカルカ★ナイトフィーバー__samfree feat. 巡音ルカ')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ルマ', 'ルマ', (SELECT id FROM artists WHERE normalized_name = 'かいりきベア feat. 初音ミク'), 'ルマ__かいりきベア feat. 初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ルル', 'ルル', (SELECT id FROM artists WHERE normalized_name = 'ado'), 'ルル__ado')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ray', 'ray', (SELECT id FROM artists WHERE normalized_name = 'bump of chicken'), 'ray__bump of chicken')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('レオ', 'レオ', (SELECT id FROM artists WHERE normalized_name = '優里'), 'レオ__優里')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('Let It Go ~ありのままで~', 'let it go ~ありのままで~', (SELECT id FROM artists WHERE normalized_name = '松たか子'), 'let it go ~ありのままで~__松たか子')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('レディメイド', 'レディメイド', (SELECT id FROM artists WHERE normalized_name = 'ado'), 'レディメイド__ado')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('Lemon', 'lemon', (SELECT id FROM artists WHERE normalized_name = '米津玄師'), 'lemon__米津玄師')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('恋愛サーキュレーション', '恋愛サーキュレーション', (SELECT id FROM artists WHERE normalized_name = '千石撫子(cv.花澤香菜)'), '恋愛サーキュレーション__千石撫子(cv.花澤香菜)')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('恋愛裁判', '恋愛裁判', (SELECT id FROM artists WHERE normalized_name = '40mp feat.初音ミク'), '恋愛裁判__40mp feat.初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ロウワー', 'ロウワー', (SELECT id FROM artists WHERE normalized_name = 'ぬゆり feat. v flower'), 'ロウワー__ぬゆり feat. v flower')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ROSE', 'rose', (SELECT id FROM artists WHERE normalized_name = 'hana'), 'rose__hana')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ローリンガール', 'ローリンガール', (SELECT id FROM artists WHERE normalized_name = 'wowaka feat. 初音ミク'), 'ローリンガール__wowaka feat. 初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('Rolling star', 'rolling star', (SELECT id FROM artists WHERE normalized_name = 'yui'), 'rolling star__yui')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ロキ', 'ロキ', (SELECT id FROM artists WHERE normalized_name = 'みきとp feat. 鏡音リン'), 'ロキ__みきとp feat. 鏡音リン')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('六兆年と一夜物語', '六兆年と一夜物語', (SELECT id FROM artists WHERE normalized_name = 'kemu feat.ia'), '六兆年と一夜物語__kemu feat.ia')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('炉心融解', '炉心融解', (SELECT id FROM artists WHERE normalized_name = 'iroha(sasaki) feat. 鏡音リン'), '炉心融解__iroha(sasaki) feat. 鏡音リン')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ロストマン', 'ロストマン', (SELECT id FROM artists WHERE normalized_name = 'bump of chicken'), 'ロストマン__bump of chicken')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ロストワンの号哭', 'ロストワンの号哭', (SELECT id FROM artists WHERE normalized_name = 'neru feat. 鏡音リン'), 'ロストワンの号哭__neru feat. 鏡音リン')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ロマンスの神様', 'ロマンスの神様', (SELECT id FROM artists WHERE normalized_name = '広瀬香美'), 'ロマンスの神様__広瀬香美')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ロミオとシンデレラ', 'ロミオとシンデレラ', (SELECT id FROM artists WHERE normalized_name = 'doriko feat.初音ミク'), 'ロミオとシンデレラ__doriko feat.初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ワールドイズマイン', 'ワールドイズマイン', (SELECT id FROM artists WHERE normalized_name = 'supercell feat.初音ミク'), 'ワールドイズマイン__supercell feat.初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('ワールドイズマイン CPK! Remix', 'ワールドイズマイン cpk! remix', (SELECT id FROM artists WHERE normalized_name = 'ryo (supercell) feat.かぐや(cv.夏吉ゆうこ) 月見ヤチヨ(cv.早見沙織)'), 'ワールドイズマイン cpk! remix__ryo (supercell) feat.かぐや(cv.夏吉ゆうこ) 月見ヤチヨ(cv.早見沙織)')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('忘れてやらない', '忘れてやらない', (SELECT id FROM artists WHERE normalized_name = '結束バンド'), '忘れてやらない__結束バンド')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('わたしに花束', 'わたしに花束', (SELECT id FROM artists WHERE normalized_name = 'ado'), 'わたしに花束__ado')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('わたしのアール', 'わたしのアール', (SELECT id FROM artists WHERE normalized_name = '和田たけあき(くらげp) feat.初音ミク'), 'わたしのアール__和田たけあき(くらげp) feat.初音ミク')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('わたしの一番かわいいところ', 'わたしの一番かわいいところ', (SELECT id FROM artists WHERE normalized_name = 'fruits zipper'), 'わたしの一番かわいいところ__fruits zipper')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('私は最強', '私は最強', (SELECT id FROM artists WHERE normalized_name = 'ado'), '私は最強__ado')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('1・2・3', '1・2・3', (SELECT id FROM artists WHERE normalized_name = 'after the rain'), '1・2・3__after the rain')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;
INSERT INTO songs (title, normalized_title, artist_id, song_key) VALUES ('One Love', 'one love', (SELECT id FROM artists WHERE normalized_name = '嵐'), 'one love__嵐')
ON CONFLICT(song_key) DO UPDATE SET
  title = excluded.title,
  normalized_title = excluded.normalized_title,
  artist_id = excluded.artist_id;

INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '愛唄__gre4n boyz(greeeen)'), (SELECT id FROM channels WHERE code = 'new'), 6, 1, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '愛言葉iii__deco*27 feat. 初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 6, 2, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '会いたくて 会いたくて__西野カナ'), (SELECT id FROM channels WHERE code = 'new'), 4, 3, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'あいつら全員同窓会__ずっと真夜中でいいのに。'), (SELECT id FROM channels WHERE code = 'new'), 3, 4, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'アイドル__yoasobi'), (SELECT id FROM channels WHERE code = 'new'), 12, 5, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'アイネクライネ__米津玄師'), (SELECT id FROM channels WHERE code = 'new'), 11, 6, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '愛のかたまり__domoto(kinki kids)'), (SELECT id FROM channels WHERE code = 'new'), 3, 7, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'アイのシナリオ__chico with honeyworks'), (SELECT id FROM channels WHERE code = 'new'), 1, 8, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '愛包ダンスホール__himehina'), (SELECT id FROM channels WHERE code = 'new'), 6, 9, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '曖昧劣情lover__koyori(電ポルp) feat.v flower'), (SELECT id FROM channels WHERE code = 'new'), 2, 10, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'iris out__米津玄師'), (SELECT id FROM channels WHERE code = 'new'), 12, 11, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'アイワナムチュー__feat. asmi, すりぃ/maisondes'), (SELECT id FROM channels WHERE code = 'new'), 4, 12, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '愛をこめて花束を__superfly'), (SELECT id FROM channels WHERE code = 'new'), 1, 13, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '青いベンチ__サスケ'), (SELECT id FROM channels WHERE code = 'new'), 1, 14, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '青空のラプソディ__fhána'), (SELECT id FROM channels WHERE code = 'new'), 2, 15, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '青のすみか__キタニタツヤ'), (SELECT id FROM channels WHERE code = 'new'), 3, 16, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'アゲハ蝶__ポルノグラフィティ'), (SELECT id FROM channels WHERE code = 'new'), 4, 17, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '阿修羅ちゃん__ado'), (SELECT id FROM channels WHERE code = 'new'), 9, 18, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'アスノヨゾラ哨戒班__orangestar feat.ia'), (SELECT id FROM channels WHERE code = 'new'), 3, 19, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '明日への扉__i wish'), (SELECT id FROM channels WHERE code = 'new'), 1, 20, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'アタシは問題作__ado'), (SELECT id FROM channels WHERE code = 'new'), 3, 21, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'あなたに__mongol800'), (SELECT id FROM channels WHERE code = 'new'), 1, 22, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'アニマル__deco*27,rockwell feat.初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 1, 23, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'アノニマス__さユり'), (SELECT id FROM channels WHERE code = 'new'), 4, 24, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'あのバンド__結束バンド'), (SELECT id FROM channels WHERE code = 'new'), 6, 25, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'アポロ__ポルノグラフィティ'), (SELECT id FROM channels WHERE code = 'new'), 1, 26, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '天ノ弱__164 feat.gumi'), (SELECT id FROM channels WHERE code = 'new'), 11, 27, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '雨とカプチーノ__ヨルシカ'), (SELECT id FROM channels WHERE code = 'new'), 7, 28, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'アルエ__bump of chicken'), (SELECT id FROM channels WHERE code = 'new'), 3, 29, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'あわてんぼうのサンタクロース__童謡'), (SELECT id FROM channels WHERE code = 'new'), 1, 30, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'アンコール__yoasobi'), (SELECT id FROM channels WHERE code = 'new'), 5, 31, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'undead__yoasobi'), (SELECT id FROM channels WHERE code = 'new'), 6, 32, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'アンドロイドガール__deco*27 feat. 初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 1, 33, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'アンバランスなkissをして__高橋ひろ'), (SELECT id FROM channels WHERE code = 'new'), 2, 34, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'unravel__tk from 凛として時雨'), (SELECT id FROM channels WHERE code = 'new'), 6, 35, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'いーあるふぁんくらぶ__みきとp feat.gumi,鏡音リン'), (SELECT id FROM channels WHERE code = 'new'), 3, 36, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ex-otogibanashi__ryo (supercell) feat.かぐや(cv.夏吉ゆうこ) 月見ヤチヨ(cv.早見沙織)'), (SELECT id FROM channels WHERE code = 'new'), 2, 37, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'イガク__原口沙輔 feat. 重音テト'), (SELECT id FROM channels WHERE code = 'new'), 3, 38, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '行くぜっ!怪盗少女__ももいろクローバーz'), (SELECT id FROM channels WHERE code = 'new'), 2, 39, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ignited -イグナイテッド-__t.m.revolution'), (SELECT id FROM channels WHERE code = 'new'), 1, 40, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'イケナイ太陽__orange range'), (SELECT id FROM channels WHERE code = 'new'), 4, 41, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '言って。__ヨルシカ'), (SELECT id FROM channels WHERE code = 'new'), 8, 42, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '命ばっかり__ぬゆり feat. v flower, 結月ゆかり'), (SELECT id FROM channels WHERE code = 'new'), 2, 43, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'いますぐ輪廻__なきそ feat. 初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 8, 44, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'invoke-インヴォーク-__t.m.revolution'), (SELECT id FROM channels WHERE code = 'new'), 4, 45, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ヴァンパイア__deco*27,rockwell feat. 初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 9, 46, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ウィーアー!__きただにひろし'), (SELECT id FROM channels WHERE code = 'new'), 4, 47, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'うい麦畑でつかまえて__しぐれうい'), (SELECT id FROM channels WHERE code = 'new'), 3, 48, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'winter,again__glay'), (SELECT id FROM channels WHERE code = 'new'), 1, 49, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'wave__niki feat.lily'), (SELECT id FROM channels WHERE code = 'new'), 1, 50, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ウタカタララバイ__ado'), (SELECT id FROM channels WHERE code = 'new'), 9, 51, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '打上花火__daoko × 米津玄師'), (SELECT id FROM channels WHERE code = 'new'), 3, 52, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'うっせぇわ__ado'), (SELECT id FROM channels WHERE code = 'new'), 8, 53, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ウミユリ海底譚__n-buna feat.初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 9, 54, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'うれしいひなまつり__童謡'), (SELECT id FROM channels WHERE code = 'new'), 1, 55, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'え?あぁ、そう。__蝶々p feat. 初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 1, 56, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '永遠のあくる日__ado'), (SELECT id FROM channels WHERE code = 'new'), 4, 57, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'エイリアンエイリアン__ナユタン星人 feat. 初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 5, 58, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'yell__いきものがかり'), (SELECT id FROM channels WHERE code = 'new'), 1, 59, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'エゴロック__すりぃ feat. 鏡音レン'), (SELECT id FROM channels WHERE code = 'new'), 5, 60, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'everyday、カチューシャ__akb48'), (SELECT id FROM channels WHERE code = 'new'), 1, 61, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ok!__松本 梨香'), (SELECT id FROM channels WHERE code = 'new'), 3, 62, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '大阪lover__dreams come true'), (SELECT id FROM channels WHERE code = 'new'), 2, 63, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'oath sign__lisa'), (SELECT id FROM channels WHERE code = 'new'), 2, 64, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'over soul__林原めぐみ'), (SELECT id FROM channels WHERE code = 'new'), 2, 65, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'overdose__なとり'), (SELECT id FROM channels WHERE code = 'new'), 3, 66, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'オーバーライド__吉田夜世 feat. 重音テト'), (SELECT id FROM channels WHERE code = 'new'), 10, 67, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'おしゃかしゃま__radwimps'), (SELECT id FROM channels WHERE code = 'new'), 2, 68, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'おジャ魔女カーニバル!!__maho堂'), (SELECT id FROM channels WHERE code = 'new'), 5, 69, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'おじゃま虫__deco*27 feat. 初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 2, 70, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'おちゃめ機能__ゴジマジp feat. 重音テト'), (SELECT id FROM channels WHERE code = 'new'), 1, 71, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'オツキミリサイタル__じん feat.ia'), (SELECT id FROM channels WHERE code = 'new'), 2, 72, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '踊__ado'), (SELECT id FROM channels WHERE code = 'new'), 5, 73, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'オトナブルー__新しい学校のリーダーズ'), (SELECT id FROM channels WHERE code = 'new'), 5, 74, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'オトノケ__creepy nuts'), (SELECT id FROM channels WHERE code = 'new'), 1, 75, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '乙女解剖__deco*27 feat.初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 9, 76, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '乙女のポリシー__石田よう子'), (SELECT id FROM channels WHERE code = 'new'), 1, 77, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'おどるポンポコリン__b.b.クイーンズ'), (SELECT id FROM channels WHERE code = 'new'), 2, 78, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '鬼ノ宴__友成空'), (SELECT id FROM channels WHERE code = 'new'), 3, 79, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'おねがいダーリン__ナナホシ管弦楽団 feat.one'), (SELECT id FROM channels WHERE code = 'new'), 3, 80, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'お勉強しといてよ__ずっと真夜中でいいのに。'), (SELECT id FROM channels WHERE code = 'new'), 2, 81, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'お返事まだカナ💦❓おじさん構文😁❗️__吉本おじさん feat. 雨衣'), (SELECT id FROM channels WHERE code = 'new'), 9, 82, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'おやすみ泣き声、さよなら歌姫__クリープハイプ'), (SELECT id FROM channels WHERE code = 'new'), 5, 83, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'only my railgun__fripside'), (SELECT id FROM channels WHERE code = 'new'), 7, 84, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '会心の一撃 yoasobi cover__yoasobi(radwimps cover)'), (SELECT id FROM channels WHERE code = 'new'), 1, 85, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '会心の一撃__radwimps'), (SELECT id FROM channels WHERE code = 'new'), 3, 86, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '怪物__yoasobi'), (SELECT id FROM channels WHERE code = 'new'), 5, 87, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '楓__スピッツ'), (SELECT id FROM channels WHERE code = 'new'), 1, 88, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '輝きは君の中に__鈴木結女'), (SELECT id FROM channels WHERE code = 'new'), 2, 89, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'かくしん的☆めたまるふぉ~ぜっ!__土間うまる(cv.田中あいみ)'), (SELECT id FROM channels WHERE code = 'new'), 2, 90, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '革命デュアリズム__水樹奈々×t.m.revolution'), (SELECT id FROM channels WHERE code = 'new'), 2, 91, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '革命道中__アイナ・ジ・エンド'), (SELECT id FROM channels WHERE code = 'new'), 9, 92, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'かくれんぼ__alia'), (SELECT id FROM channels WHERE code = 'new'), 5, 93, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '重音テトはこんなパーティ二人で抜け出せるのか__かてらざわ feat. 重音テト,初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 1, 94, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'カタオモイ__aimer'), (SELECT id FROM channels WHERE code = 'new'), 1, 95, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '奏__スキマスイッチ'), (SELECT id FROM channels WHERE code = 'new'), 6, 96, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '歌舞伎町の女王__椎名林檎'), (SELECT id FROM channels WHERE code = 'new'), 2, 97, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'カブトムシ__aiko'), (SELECT id FROM channels WHERE code = 'new'), 1, 98, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '神っぽいな__ピノキオピー feat.初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 8, 99, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '神のまにまに__れるりり feat. 初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 1, 100, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'カリスマックス__snow man'), (SELECT id FROM channels WHERE code = 'new'), 1, 101, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'カルマ__bump of chicken'), (SELECT id FROM channels WHERE code = 'new'), 7, 102, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'かわいいだけじゃだめですか?__cutie street'), (SELECT id FROM channels WHERE code = 'new'), 5, 103, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '可愛くてごめん__feat. ちゅーたん(cv.早見沙織)/honeyworks'), (SELECT id FROM channels WHERE code = 'new'), 8, 104, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '勘冴えて悔しいわ__ずっと真夜中でいいのに。'), (SELECT id FROM channels WHERE code = 'new'), 4, 105, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'キセキ__gre4n boyz(greeeen)'), (SELECT id FROM channels WHERE code = 'new'), 3, 106, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ギターと孤独と蒼い惑星__結束バンド'), (SELECT id FROM channels WHERE code = 'new'), 5, 107, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'kick back__米津玄師'), (SELECT id FROM channels WHERE code = 'new'), 8, 108, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '気まぐれロマンティック__いきものがかり'), (SELECT id FROM channels WHERE code = 'new'), 4, 109, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'キミと××××したいだけ__ファントムシータ'), (SELECT id FROM channels WHERE code = 'new'), 2, 110, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '君はロックを聴かない__あいみょん'), (SELECT id FROM channels WHERE code = 'new'), 5, 111, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '君をのせて__君をのせて'), (SELECT id FROM channels WHERE code = 'new'), 1, 112, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '逆光__ado'), (SELECT id FROM channels WHERE code = 'new'), 2, 113, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'catch you catch me__グミ(日向めぐみ)'), (SELECT id FROM channels WHERE code = 'new'), 1, 114, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'キャットラビング__香椎モイミ feat. 可不'), (SELECT id FROM channels WHERE code = 'new'), 4, 115, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'きゅうくらりん__いよわ feat. 可不'), (SELECT id FROM channels WHERE code = 'new'), 1, 116, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'キューティーハニー__倖田來未'), (SELECT id FROM channels WHERE code = 'new'), 2, 117, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'キュートなカノジョ__syudou feat.可不'), (SELECT id FROM channels WHERE code = 'new'), 1, 118, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '狭心症__radwimps'), (SELECT id FROM channels WHERE code = 'new'), 1, 119, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '強風オールバック__yukopi feat. 歌愛ユキ'), (SELECT id FROM channels WHERE code = 'new'), 6, 120, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'キラキラ__aiko'), (SELECT id FROM channels WHERE code = 'new'), 1, 121, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ギラギラ__ado'), (SELECT id FROM channels WHERE code = 'new'), 7, 122, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '金魚花火__大塚愛'), (SELECT id FROM channels WHERE code = 'new'), 1, 123, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'king__kanaria feat. gumi'), (SELECT id FROM channels WHERE code = 'new'), 4, 124, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '金曜日のおはよう__honeyworks feat. gumi'), (SELECT id FROM channels WHERE code = 'new'), 7, 125, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'グッバイ宣言__chinozo feat. v flower'), (SELECT id FROM channels WHERE code = 'new'), 5, 126, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'クラクラ__ado'), (SELECT id FROM channels WHERE code = 'new'), 7, 127, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'glamorous sky__中島美嘉'), (SELECT id FROM channels WHERE code = 'new'), 2, 128, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'クリスマスソング__back number'), (SELECT id FROM channels WHERE code = 'new'), 1, 129, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '紅蓮華__lisa'), (SELECT id FROM channels WHERE code = 'new'), 4, 130, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '紅蓮の弓矢__linked horizon'), (SELECT id FROM channels WHERE code = 'new'), 2, 131, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '群青__yoasobi'), (SELECT id FROM channels WHERE code = 'new'), 11, 132, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '群青日和__東京事変'), (SELECT id FROM channels WHERE code = 'new'), 1, 133, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ケッペキショウ__すこっぷ feat. gumi'), (SELECT id FROM channels WHERE code = 'new'), 1, 134, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '限界突破×サバイバー__氷川きよし'), (SELECT id FROM channels WHERE code = 'new'), 2, 135, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '恋__星野源'), (SELECT id FROM channels WHERE code = 'new'), 1, 136, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '恋するフォーチュンクッキー__akb48'), (SELECT id FROM channels WHERE code = 'new'), 2, 137, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '恋はスリル、ショック、サスペンス__愛内里菜'), (SELECT id FROM channels WHERE code = 'new'), 1, 138, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '航海の唄__さユり'), (SELECT id FROM channels WHERE code = 'new'), 8, 139, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ゴーストルール__deco*27 feat. 初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 4, 140, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'goldfinger ''99__郷ひろみ'), (SELECT id FROM channels WHERE code = 'new'), 1, 141, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '心做し__蝶々p feat. gumi'), (SELECT id FROM channels WHERE code = 'new'), 6, 142, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'こちら、幸福安心委員会です。__うたたp feat. 初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 2, 143, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'さぁ__surface'), (SELECT id FROM channels WHERE code = 'new'), 1, 144, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'サイノウサンプラー__koyori(電ポルp) feat. sou'), (SELECT id FROM channels WHERE code = 'new'), 1, 145, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'サイレントマジョリティー__欅坂46'), (SELECT id FROM channels WHERE code = 'new'), 1, 146, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'sign__mr.children'), (SELECT id FROM channels WHERE code = 'new'), 1, 147, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'サインはb__b小町'), (SELECT id FROM channels WHERE code = 'new'), 10, 148, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'サウダージ__ポルノグラフィティ'), (SELECT id FROM channels WHERE code = 'new'), 3, 149, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'さくら (独唱)__森山直太朗'), (SELECT id FROM channels WHERE code = 'new'), 1, 150, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'さくらんぼ__大塚愛'), (SELECT id FROM channels WHERE code = 'new'), 2, 151, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '雑魚__柊マグネタイト feat. 亞北ネル(初音ミク)'), (SELECT id FROM channels WHERE code = 'new'), 5, 152, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'サターン__ずっと真夜中でいいのに。'), (SELECT id FROM channels WHERE code = 'new'), 1, 153, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ザムザ__25時、ナイトコードで。'), (SELECT id FROM channels WHERE code = 'new'), 2, 154, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'さよならエレジー__菅田将暉'), (SELECT id FROM channels WHERE code = 'new'), 2, 155, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'サリシノハラ__みきとp feat.初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 5, 156, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '3月9日__レミオロメン'), (SELECT id FROM channels WHERE code = 'new'), 3, 157, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '残機__ずっと真夜中でいいのに。'), (SELECT id FROM channels WHERE code = 'new'), 6, 158, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '残響散歌__aimer'), (SELECT id FROM channels WHERE code = 'new'), 5, 159, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '三原色__yoasobi'), (SELECT id FROM channels WHERE code = 'new'), 6, 160, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '残酷な天使のテーゼ__高橋洋子'), (SELECT id FROM channels WHERE code = 'new'), 7, 161, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '366日__hy'), (SELECT id FROM channels WHERE code = 'new'), 1, 162, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'secret base〜君がくれたもの〜__zone'), (SELECT id FROM channels WHERE code = 'new'), 2, 163, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'シーソーゲーム 〜勇敢な恋の歌〜__mr.children'), (SELECT id FROM channels WHERE code = 'new'), 1, 164, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'jane doe__米津玄師&宇多田ヒカル'), (SELECT id FROM channels WHERE code = 'new'), 3, 165, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ジェヘナ__wotaku feat. 初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 2, 166, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'シカ色デイズ__シカ部'), (SELECT id FROM channels WHERE code = 'new'), 2, 167, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'zips__t.m.revolution'), (SELECT id FROM channels WHERE code = 'new'), 1, 168, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '斜陽__ヨルシカ'), (SELECT id FROM channels WHERE code = 'new'), 7, 169, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '車輪の唄__bump of chicken'), (SELECT id FROM channels WHERE code = 'new'), 9, 170, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'シャルル__バルーン feat. v flower'), (SELECT id FROM channels WHERE code = 'new'), 5, 171, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ジャンキーナイトタウンオーケストラ__すりぃ feat. 鏡音レン'), (SELECT id FROM channels WHERE code = 'new'), 2, 172, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '終焉逃避行__柊マグネタイト feat. 初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 1, 173, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '十面相__ym feat. gumi'), (SELECT id FROM channels WHERE code = 'new'), 1, 174, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'シュガーソングとビターステップ__unison square garden'), (SELECT id FROM channels WHERE code = 'new'), 2, 175, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '粛聖!! ロリ神レクイエム☆__しぐれうい'), (SELECT id FROM channels WHERE code = 'new'), 12, 176, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '祝福__yoasobi'), (SELECT id FROM channels WHERE code = 'new'), 8, 177, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'じょいふる__いきものがかり'), (SELECT id FROM channels WHERE code = 'new'), 2, 178, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '唱__ado'), (SELECT id FROM channels WHERE code = 'new'), 7, 179, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '少女s__scandal'), (SELECT id FROM channels WHERE code = 'new'), 1, 180, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '少女レイ__みきとp feat. 初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 12, 181, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'シル・ヴ・プレジデント__p丸様。'), (SELECT id FROM channels WHERE code = 'new'), 7, 182, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '深海少女__ゆうゆ feat.初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 4, 183, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'synchrogazer__水樹奈々'), (SELECT id FROM channels WHERE code = 'new'), 2, 184, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '新時代__ado'), (SELECT id FROM channels WHERE code = 'new'), 8, 185, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'シンデレラ__deco*27,rockwell feat,初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 1, 186, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'スイートマジック__junky feat. 鏡音リン'), (SELECT id FROM channels WHERE code = 'new'), 3, 187, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '彗星ハネムーン__ナユタン星人 feat. 初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 2, 188, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ずうっといっしょ!__キタニタツヤ'), (SELECT id FROM channels WHERE code = 'new'), 3, 189, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'すき、きらい__ファントムシータ'), (SELECT id FROM channels WHERE code = 'new'), 2, 190, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '好きすぎて滅!__m!lk'), (SELECT id FROM channels WHERE code = 'new'), 10, 191, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'starry heavens__day after tomorrow'), (SELECT id FROM channels WHERE code = 'new'), 1, 192, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ストリーミングハート__deco*27 feat. 初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 1, 193, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'snow halation__μ''s'), (SELECT id FROM channels WHERE code = 'new'), 2, 194, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'スノースマイル__bump of chicken'), (SELECT id FROM channels WHERE code = 'new'), 2, 195, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'スピカ__ロクデナ'), (SELECT id FROM channels WHERE code = 'new'), 1, 196, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'すろぉもぉしょん__ピノキオピー feat. 初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 1, 197, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '星座になれたら__結束バンド'), (SELECT id FROM channels WHERE code = 'new'), 20, 198, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '青春アミーゴ__修二と彰'), (SELECT id FROM channels WHERE code = 'new'), 1, 199, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '青春コンプレックス__結束バンド'), (SELECT id FROM channels WHERE code = 'new'), 8, 200, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'sailing day__bump of chicken'), (SELECT id FROM channels WHERE code = 'new'), 3, 201, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '世界に一つだけの花__smap'), (SELECT id FROM channels WHERE code = 'new'), 2, 203, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '世界は恋に落ちている__chico with honeyworks'), (SELECT id FROM channels WHERE code = 'new'), 8, 204, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '絶頂讃歌__和ぬか'), (SELECT id FROM channels WHERE code = 'new'), 3, 205, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'セツナトリップ__last note. feat.gumi'), (SELECT id FROM channels WHERE code = 'new'), 5, 206, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'セブンティーン__yoasobi'), (SELECT id FROM channels WHERE code = 'new'), 6, 207, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'セレナーデ__なとり'), (SELECT id FROM channels WHERE code = 'new'), 4, 208, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '前前前世__radwimps'), (SELECT id FROM channels WHERE code = 'new'), 4, 209, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '千本桜__黒うさp feat.初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 10, 210, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '相思相愛__aiko'), (SELECT id FROM channels WHERE code = 'new'), 5, 211, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '創聖のアクエリオン__akino'), (SELECT id FROM channels WHERE code = 'new'), 3, 212, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ゾクゾク__ファントムシータ'), (SELECT id FROM channels WHERE code = 'new'), 3, 213, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'そして僕にできるコト__day after tomorrow'), (SELECT id FROM channels WHERE code = 'new'), 1, 214, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'そばかす__judy and mary'), (SELECT id FROM channels WHERE code = 'new'), 2, 215, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '空も飛べるはず__スピッツ'), (SELECT id FROM channels WHERE code = 'new'), 4, 216, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'それは小さな光のような__さユり'), (SELECT id FROM channels WHERE code = 'new'), 4, 217, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ダーリン__須田景凪'), (SELECT id FROM channels WHERE code = 'new'), 3, 218, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ダーリン__mrs. green apple'), (SELECT id FROM channels WHERE code = 'new'), 2, 219, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ダーリンダンス__かいりきベア feat.初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 15, 220, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '大切なもの__ロードオブメジャー'), (SELECT id FROM channels WHERE code = 'new'), 1, 221, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ダイダイダイダイダイキライ__雨良(amala) feat. 初音ミク,重音テト'), (SELECT id FROM channels WHERE code = 'new'), 5, 222, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'taidada__ずっと真夜中でいいのに。'), (SELECT id FROM channels WHERE code = 'new'), 10, 223, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '第六感__reol'), (SELECT id FROM channels WHERE code = 'new'), 2, 224, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'だから僕は音楽を辞めた__ヨルシカ'), (SELECT id FROM channels WHERE code = 'new'), 10, 225, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '竹取オーバーナイトセンセーション__honeyworks feat.鏡音リン,鏡音レン'), (SELECT id FROM channels WHERE code = 'new'), 2, 226, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ただ君に晴れ__ヨルシカ'), (SELECT id FROM channels WHERE code = 'new'), 12, 227, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '正しくなれない__ずっと真夜中でいいのに。'), (SELECT id FROM channels WHERE code = 'new'), 2, 228, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '脱法ロック__neru feat. 鏡音レン'), (SELECT id FROM channels WHERE code = 'new'), 3, 229, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '魂のルフラン__高橋洋子'), (SELECT id FROM channels WHERE code = 'new'), 1, 230, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'タマシイレボリューション__superfly'), (SELECT id FROM channels WHERE code = 'new'), 1, 231, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'darma grand prix__radwimps'), (SELECT id FROM channels WHERE code = 'new'), 1, 232, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'だれかの心臓になれたなら__ユリイ・カノン feat. gumi'), (SELECT id FROM channels WHERE code = 'new'), 1, 233, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'dan dan 心魅かれてく__field of view'), (SELECT id FROM channels WHERE code = 'new'), 1, 234, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ダンシング・ヒーロー(eat you up)__荻野目洋子'), (SELECT id FROM channels WHERE code = 'new'), 1, 235, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '小さな恋のうた__mongol800'), (SELECT id FROM channels WHERE code = 'new'), 3, 236, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'チェリー__スピッツ'), (SELECT id FROM channels WHERE code = 'new'), 2, 237, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'che.r.ry__yui'), (SELECT id FROM channels WHERE code = 'new'), 3, 238, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'チェリーポップ__deco*27 feat. 初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 9, 239, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '地球最後の告白を__kemu feat.gumi'), (SELECT id FROM channels WHERE code = 'new'), 4, 240, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'チャンカパーナ__news'), (SELECT id FROM channels WHERE code = 'new'), 5, 241, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ちゅ、多様性。__ano'), (SELECT id FROM channels WHERE code = 'new'), 7, 242, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'チュルリラ・チュルリラ・ダッダッダ!__和田たけあき(くらげp) feat. 結月ゆかり'), (SELECT id FROM channels WHERE code = 'new'), 2, 243, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '超主人公__ピノキオピー feat. 初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 1, 244, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '超絶かわいい__mona(cv.夏川椎菜) feat.honeyworks'), (SELECT id FROM channels WHERE code = 'new'), 2, 245, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'チョコレイト・ディスコ__perfume'), (SELECT id FROM channels WHERE code = 'new'), 3, 246, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'チョコレートメランコリー__≠me'), (SELECT id FROM channels WHERE code = 'new'), 1, 247, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '月と花束__さユり'), (SELECT id FROM channels WHERE code = 'new'), 5, 248, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 't氏の話を信じるな__ピノキオピー feat. 初音ミク,重音テト'), (SELECT id FROM channels WHERE code = 'new'), 2, 249, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'tt__twice'), (SELECT id FROM channels WHERE code = 'new'), 1, 250, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '手紙~拝啓十五の君へ~__アンジェラ・アキ'), (SELECT id FROM channels WHERE code = 'new'), 1, 251, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'test me__ちゃんみな'), (SELECT id FROM channels WHERE code = 'new'), 5, 252, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'テトリス__柊マグネタイト feat. 重音テト'), (SELECT id FROM channels WHERE code = 'new'), 11, 253, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'デビルじゃないもん__deco*27,ピノキオピー feat. 初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 4, 254, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'tell your world__livetune feat.初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 5, 255, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'テレキャスタービーボーイ__すりぃ feat. 鏡音レン'), (SELECT id FROM channels WHERE code = 'new'), 1, 256, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'テレパシ__deco*27 feat. 初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 8, 257, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '天樂__ゆうゆ feat. 鏡音リン'), (SELECT id FROM channels WHERE code = 'new'), 2, 258, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '転生林檎__ピノキオピー feat. 初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 7, 259, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '天体観測__bump of chicken'), (SELECT id FROM channels WHERE code = 'new'), 9, 260, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'トウキョウ・シャンディ・ランデヴ__feat. 花譜,ツミキ/maisondes'), (SELECT id FROM channels WHERE code = 'new'), 6, 261, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '東京テディベア__neru feat. 鏡音リン'), (SELECT id FROM channels WHERE code = 'new'), 1, 262, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'truth__嵐'), (SELECT id FROM channels WHERE code = 'new'), 3, 263, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ドーナツホール__ハチ feat. gumi'), (SELECT id FROM channels WHERE code = 'new'), 8, 264, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ド屑__なきそ feat.歌愛ユキ'), (SELECT id FROM channels WHERE code = 'new'), 3, 265, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'とくべチュ、して__=love'), (SELECT id FROM channels WHERE code = 'new'), 2, 266, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ドミノ倒シ__すこっぷ feat. 初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 1, 267, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ドライフラワー__優里'), (SELECT id FROM channels WHERE code = 'new'), 7, 268, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'トリノコシティ__40mp feat. 初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 4, 269, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'トレモロ__radwimps'), (SELECT id FROM channels WHERE code = 'new'), 1, 270, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '夏色__ゆず'), (SELECT id FROM channels WHERE code = 'new'), 1, 271, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '夏祭り__jitterin''jinn(cover whiteberry)'), (SELECT id FROM channels WHERE code = 'new'), 2, 272, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '名前のない怪物__egoist'), (SELECT id FROM channels WHERE code = 'new'), 4, 273, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '何度でも__dreams come true'), (SELECT id FROM channels WHERE code = 'new'), 4, 274, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '人間e判定__ヨーメイ'), (SELECT id FROM channels WHERE code = 'new'), 4, 275, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'にんじゃりばんばん__きゃりーぱみゅぱみゅ'), (SELECT id FROM channels WHERE code = 'new'), 1, 276, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '寝起きヤシの木__yukopi feat. 歌愛ユキ'), (SELECT id FROM channels WHERE code = 'new'), 2, 277, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '脳漿炸裂ガール__れるりり feat.初音ミク,gumi'), (SELECT id FROM channels WHERE code = 'new'), 4, 278, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '脳裏上のクラッカー__ずっと真夜中でいいのに。'), (SELECT id FROM channels WHERE code = 'new'), 1, 279, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ノンブレス・オブリージュ__ピノキオピー feat. 初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 3, 280, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'birthday song__さユり'), (SELECT id FROM channels WHERE code = 'new'), 1, 281, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'はいよろこんで__こっちのけんと'), (SELECT id FROM channels WHERE code = 'new'), 3, 282, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'バグ__かいりきベア feat.初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 1, 283, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '白日__king gnu'), (SELECT id FROM channels WHERE code = 'new'), 2, 284, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '爆裂愛してる__m!lk'), (SELECT id FROM channels WHERE code = 'new'), 3, 285, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'パジャマパーティーズのうた__パジャマパーティーズ'), (SELECT id FROM channels WHERE code = 'new'), 1, 286, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'butter-fly__和田光司'), (SELECT id FROM channels WHERE code = 'new'), 5, 287, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ハッピーシンセサイザ__easy pop feat.巡音ルカ,gumi'), (SELECT id FROM channels WHERE code = 'new'), 6, 288, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'happy halloween__junky feat. 鏡音リン'), (SELECT id FROM channels WHERE code = 'new'), 1, 289, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '花になって__緑黄色社会'), (SELECT id FROM channels WHERE code = 'new'), 6, 290, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '花に亡霊__ヨルシカ'), (SELECT id FROM channels WHERE code = 'new'), 1, 291, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '花の塔__さユり'), (SELECT id FROM channels WHERE code = 'new'), 14, 292, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'hanabi__mr.children'), (SELECT id FROM channels WHERE code = 'new'), 1, 293, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'はなまるぴっぴはよいこだけ__a応p'), (SELECT id FROM channels WHERE code = 'new'), 1, 294, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ハナミズキ__一青窈'), (SELECT id FROM channels WHERE code = 'new'), 1, 295, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'happiness__嵐'), (SELECT id FROM channels WHERE code = 'new'), 6, 296, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ham__ずっと真夜中でいいのに。'), (SELECT id FROM channels WHERE code = 'new'), 2, 297, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ハム太郎 とっとこうた__ハムちゃんず'), (SELECT id FROM channels WHERE code = 'new'), 4, 298, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '晴る__ヨルシカ'), (SELECT id FROM channels WHERE code = 'new'), 6, 299, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ハルカ__yoasobi'), (SELECT id FROM channels WHERE code = 'new'), 6, 300, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ハルジオン__yoasobi'), (SELECT id FROM channels WHERE code = 'new'), 5, 301, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ハレ晴レユカイ__涼宮ハルヒ(cv.平野綾),長門有希(cv.茅原実里),朝比奈みくる(cv.後藤邑子)'), (SELECT id FROM channels WHERE code = 'new'), 2, 302, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ハレンチ__ちゃんみな'), (SELECT id FROM channels WHERE code = 'new'), 2, 303, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'hello,again~昔からある場所~__my little lover'), (SELECT id FROM channels WHERE code = 'new'), 1, 304, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '晩餐歌__tuki.'), (SELECT id FROM channels WHERE code = 'new'), 11, 305, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'パンダヒーロー__ハチ feat. gumi'), (SELECT id FROM channels WHERE code = 'new'), 6, 306, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ピースサイン__米津玄師'), (SELECT id FROM channels WHERE code = 'new'), 4, 307, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'bのリベンジ__b小町'), (SELECT id FROM channels WHERE code = 'new'), 3, 308, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ヒカリへ__miwa'), (SELECT id FROM channels WHERE code = 'new'), 1, 309, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '美少女無罪♡パイレーツ__宝鐘マリン'), (SELECT id FROM channels WHERE code = 'new'), 6, 310, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ヒッチコック__ヨルシカ'), (SELECT id FROM channels WHERE code = 'new'), 2, 311, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '人マニア__原口沙輔 feat. 重音テト'), (SELECT id FROM channels WHERE code = 'new'), 4, 312, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ひとりごつ__ハチワレ(cv.田中誠人)'), (SELECT id FROM channels WHERE code = 'new'), 10, 313, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '独りんぼエンヴィー__koyori(電ポルp) feat.初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 8, 314, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ヒバナ__deco*27 feat. 初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 4, 315, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ヒビカセ__ギガp feat. 初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 1, 316, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ビビっとラブ__chico with honeyworks meets まふまふ'), (SELECT id FROM channels WHERE code = 'new'), 1, 317, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ビビデバ__星街すいせい'), (SELECT id FROM channels WHERE code = 'new'), 9, 318, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'beautiful world__宇多田ヒカル'), (SELECT id FROM channels WHERE code = 'new'), 1, 319, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ヒューマノイド__ずっと真夜中でいいのに。'), (SELECT id FROM channels WHERE code = 'new'), 2, 320, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ひゅるりらぱっぱ__tuki.'), (SELECT id FROM channels WHERE code = 'new'), 3, 321, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '秒針を噛む__ずっと真夜中でいいのに。'), (SELECT id FROM channels WHERE code = 'new'), 5, 322, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'believe__folder5'), (SELECT id FROM channels WHERE code = 'new'), 1, 323, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ヒロイン育成計画__feat. 涼海ひより(cv.水瀬いのり)/honeyworks'), (SELECT id FROM channels WHERE code = 'new'), 4, 324, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'first love__宇多田ヒカル'), (SELECT id FROM channels WHERE code = 'new'), 3, 325, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ファタール__gemn'), (SELECT id FROM channels WHERE code = 'new'), 1, 326, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ファンサ__mona(cv.夏川椎菜) feat.honeyworks'), (SELECT id FROM channels WHERE code = 'new'), 16, 327, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'フォニイ__ツミキ feat. 可不'), (SELECT id FROM channels WHERE code = 'new'), 11, 328, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '不協和音__欅坂46'), (SELECT id FROM channels WHERE code = 'new'), 2, 329, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ふたりごと__radwimps'), (SELECT id FROM channels WHERE code = 'new'), 4, 330, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'フライングゲット__akb48'), (SELECT id FROM channels WHERE code = 'new'), 3, 331, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'plazma__米津玄師'), (SELECT id FROM channels WHERE code = 'new'), 4, 332, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'flags__t.m.revolution'), (SELECT id FROM channels WHERE code = 'new'), 1, 333, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'プラネタリウム__大塚愛'), (SELECT id FROM channels WHERE code = 'new'), 6, 334, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'flamingo__米津玄師'), (SELECT id FROM channels WHERE code = 'new'), 1, 335, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'フラレガイガール__さユり'), (SELECT id FROM channels WHERE code = 'new'), 6, 336, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ブリキノダンス__日向電工 feat. 初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 9, 337, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'preserved roses__t.m.revolution×水樹奈々'), (SELECT id FROM channels WHERE code = 'new'), 2, 338, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'pretender__official髭男dism'), (SELECT id FROM channels WHERE code = 'new'), 3, 339, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'bling-bang-bang-born__creepy nuts'), (SELECT id FROM channels WHERE code = 'new'), 8, 340, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ブルーバード__いきものがかり'), (SELECT id FROM channels WHERE code = 'new'), 6, 341, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ブルーベリー・ナイツ__マカロニえんぴつ'), (SELECT id FROM channels WHERE code = 'new'), 3, 342, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'プロポーズ__なとり'), (SELECT id FROM channels WHERE code = 'new'), 2, 343, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '平行線__さユり'), (SELECT id FROM channels WHERE code = 'new'), 3, 344, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'best friend__西野カナ'), (SELECT id FROM channels WHERE code = 'new'), 2, 345, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ベテルギウス__優里'), (SELECT id FROM channels WHERE code = 'new'), 7, 346, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ベノム__かいりきベア feat. v flower'), (SELECT id FROM channels WHERE code = 'new'), 3, 347, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ヘビーローテーション__akb48'), (SELECT id FROM channels WHERE code = 'new'), 3, 348, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '亡國覚醒カタルシス__ali project'), (SELECT id FROM channels WHERE code = 'new'), 1, 349, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '誇り高きアイドル__honey works feat. kotoha'), (SELECT id FROM channels WHERE code = 'new'), 5, 350, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '星降る海__aqu3ra,月見ヤチヨ(cv.早見沙織)'), (SELECT id FROM channels WHERE code = 'new'), 3, 351, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'hot limit__t.m.revolution'), (SELECT id FROM channels WHERE code = 'new'), 4, 352, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'botばっか__ファントムシータ'), (SELECT id FROM channels WHERE code = 'new'), 4, 353, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'pop in 2__b小町'), (SELECT id FROM channels WHERE code = 'new'), 6, 354, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ポニーテールとシュシュ__akb48'), (SELECT id FROM channels WHERE code = 'new'), 3, 355, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '微笑みの爆弾__馬渡松子'), (SELECT id FROM channels WHERE code = 'new'), 2, 356, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '炎__lisa'), (SELECT id FROM channels WHERE code = 'new'), 1, 357, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'white breath__t.m.revolution'), (SELECT id FROM channels WHERE code = 'new'), 2, 358, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'white love__speed'), (SELECT id FROM channels WHERE code = 'new'), 1, 359, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'pon pon pon__きゃりーぱみゅぱみゅ'), (SELECT id FROM channels WHERE code = 'new'), 1, 360, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '本能__椎名林檎'), (SELECT id FROM channels WHERE code = 'new'), 1, 361, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'マーシャル・マキシマイザー__柊マグネタイト feat. 可不'), (SELECT id FROM channels WHERE code = 'new'), 6, 362, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '負けないで__zard'), (SELECT id FROM channels WHERE code = 'new'), 2, 363, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'マシュマロ__deco*27 feat. 初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 1, 364, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '魔弾__t.m.revolution'), (SELECT id FROM channels WHERE code = 'new'), 1, 365, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '真っ赤な空を見ただろうか__bump of chicken'), (SELECT id FROM channels WHERE code = 'new'), 2, 366, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'マトリョシカ__ハチ feat.初音ミク,gumi'), (SELECT id FROM channels WHERE code = 'new'), 2, 367, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '魔法少女とチョコレゐト__ピノキオピー feat. 初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 3, 368, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '丸の内サディスティック__椎名林檎'), (SELECT id FROM channels WHERE code = 'new'), 5, 369, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '回る空うさぎ__orangestar feat. 初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 4, 370, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'meteor -ミーティア-__t.m.revolution'), (SELECT id FROM channels WHERE code = 'new'), 3, 371, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ミカヅキ__さユり'), (SELECT id FROM channels WHERE code = 'new'), 12, 372, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '右肩の蝶__のりぴー feat. 鏡音レン'), (SELECT id FROM channels WHERE code = 'new'), 7, 373, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ミックスナッツ__official髭男dism'), (SELECT id FROM channels WHERE code = 'new'), 6, 374, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'みむかゥわナイストライ__ぬぬぬぬぬぬぬぬぬぬぬぬぬぬぬぬ feat. 初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 2, 375, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ミュージック・アワー__ポルノグラフィティ'), (SELECT id FROM channels WHERE code = 'new'), 1, 376, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ムーンライト伝説__dali'), (SELECT id FROM channels WHERE code = 'new'), 6, 377, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ム責任集合体__マサラダ feat. 重音テト'), (SELECT id FROM channels WHERE code = 'new'), 3, 378, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'めざせポケモンマスター__松本 梨香'), (SELECT id FROM channels WHERE code = 'new'), 5, 379, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'メフィスト__女王蜂'), (SELECT id FROM channels WHERE code = 'new'), 4, 380, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '女々しくて__ゴールデンボンバー'), (SELECT id FROM channels WHERE code = 'new'), 2, 381, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'mela!__緑黄色社会'), (SELECT id FROM channels WHERE code = 'new'), 3, 382, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'メランコリーキッチン__米津玄師'), (SELECT id FROM channels WHERE code = 'new'), 2, 383, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'メランコリック__junky feat.鏡音リン'), (SELECT id FROM channels WHERE code = 'new'), 5, 384, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'メリクリ__boa'), (SELECT id FROM channels WHERE code = 'new'), 2, 385, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'メリュー__n-buna feat. 初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 3, 386, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'メルト__ryo(supercell) feat. 初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 12, 387, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'メルト cpk! remix__ryo (supercell) feat.かぐや(cv.夏吉ゆうこ)'), (SELECT id FROM channels WHERE code = 'new'), 2, 388, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'メンタルチェンソー__p丸様。'), (SELECT id FROM channels WHERE code = 'new'), 2, 389, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '妄想感傷代償連盟__deco*27 feat. 初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 4, 390, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '妄想疾患■ガール__もじゃ,れるりり feat. gumi'), (SELECT id FROM channels WHERE code = 'new'), 1, 391, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '妄想税__deco*27 feat. 初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 3, 392, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '目撃!テト31世__はろける feat. 雨衣,重音テト'), (SELECT id FROM channels WHERE code = 'new'), 1, 393, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'モザイクカケラ__sunset swish'), (SELECT id FROM channels WHERE code = 'new'), 1, 394, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'モザイクロール__deco*27 feat. gumi'), (SELECT id FROM channels WHERE code = 'new'), 6, 395, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'モニタリング__deco*27 feat. 初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 8, 396, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'monster__嵐'), (SELECT id FROM channels WHERE code = 'new'), 1, 397, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'やさしさで溢れるように__juju'), (SELECT id FROM channels WHERE code = 'new'), 1, 398, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '勇者__yoasobi'), (SELECT id FROM channels WHERE code = 'new'), 5, 399, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '有心論__radwimps'), (SELECT id FROM channels WHERE code = 'new'), 7, 400, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '幽霊東京__ayase feat. 初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 4, 401, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '雪だるまつくろう__神田沙也加,稲葉菜月,諸星すみれ'), (SELECT id FROM channels WHERE code = 'new'), 2, 402, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '雪の華__中島美嘉'), (SELECT id FROM channels WHERE code = 'new'), 1, 403, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '夜明けと蛍__n-buna feat.初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 9, 404, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '酔いどれ知らず__kanaria feat. gumi'), (SELECT id FROM channels WHERE code = 'new'), 1, 405, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '吉原ラメント__亜沙 feat.重音テト'), (SELECT id FROM channels WHERE code = 'new'), 4, 406, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '夜もすがら君想ふ__tokotoko(西沢さんp) feat. gumi'), (SELECT id FROM channels WHERE code = 'new'), 13, 407, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '夜に駆ける__yoasobi'), (SELECT id FROM channels WHERE code = 'new'), 5, 408, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '夜の踊り子__サカナクション'), (SELECT id FROM channels WHERE code = 'new'), 1, 409, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '弱虫モンブラン__deco*27 feat. gumi'), (SELECT id FROM channels WHERE code = 'new'), 6, 410, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ライアーダンサー__マサラダ feat. 重音テト'), (SELECT id FROM channels WHERE code = 'new'), 2, 411, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ライオン__may''n,中島 愛'), (SELECT id FROM channels WHERE code = 'new'), 5, 412, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '来世で会おう__さユり'), (SELECT id FROM channels WHERE code = 'new'), 3, 413, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ライラック__mrs. green apple'), (SELECT id FROM channels WHERE code = 'new'), 10, 414, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ラヴィ__すりぃ feat,鏡音レン'), (SELECT id FROM channels WHERE code = 'new'), 5, 415, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ラズベリー*モンスター__honeyworks feat. 初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 1, 416, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'love so sweet__嵐'), (SELECT id FROM channels WHERE code = 'new'), 8, 417, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ラフ・メイカー__bump of chicken'), (SELECT id FROM channels WHERE code = 'new'), 2, 418, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ラブカ?__柊キライ feat. v flower'), (SELECT id FROM channels WHERE code = 'new'), 6, 419, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ラブチーノ__junky feat. 鏡音リン'), (SELECT id FROM channels WHERE code = 'new'), 1, 420, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'reason__玉置成実'), (SELECT id FROM channels WHERE code = 'new'), 1, 421, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'リードコントロール__なるみや'), (SELECT id FROM channels WHERE code = 'new'), 5, 422, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'remember__yuigot,月見ヤチヨ(cv.早見沙織)'), (SELECT id FROM channels WHERE code = 'new'), 1, 423, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ルカルカ★ナイトフィーバー__samfree feat. 巡音ルカ'), (SELECT id FROM channels WHERE code = 'new'), 7, 424, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ルマ__かいりきベア feat. 初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 1, 425, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ルル__ado'), (SELECT id FROM channels WHERE code = 'new'), 4, 426, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ray__bump of chicken'), (SELECT id FROM channels WHERE code = 'new'), 13, 427, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'レオ__優里'), (SELECT id FROM channels WHERE code = 'new'), 3, 428, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'let it go ~ありのままで~__松たか子'), (SELECT id FROM channels WHERE code = 'new'), 2, 429, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'レディメイド__ado'), (SELECT id FROM channels WHERE code = 'new'), 5, 430, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'lemon__米津玄師'), (SELECT id FROM channels WHERE code = 'new'), 5, 431, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '恋愛サーキュレーション__千石撫子(cv.花澤香菜)'), (SELECT id FROM channels WHERE code = 'new'), 7, 432, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '恋愛裁判__40mp feat.初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 5, 433, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ロウワー__ぬゆり feat. v flower'), (SELECT id FROM channels WHERE code = 'new'), 11, 434, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'rose__hana'), (SELECT id FROM channels WHERE code = 'new'), 3, 435, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ローリンガール__wowaka feat. 初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 8, 436, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'rolling star__yui'), (SELECT id FROM channels WHERE code = 'new'), 2, 437, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ロキ__みきとp feat. 鏡音リン'), (SELECT id FROM channels WHERE code = 'new'), 7, 438, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '六兆年と一夜物語__kemu feat.ia'), (SELECT id FROM channels WHERE code = 'new'), 7, 439, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '炉心融解__iroha(sasaki) feat. 鏡音リン'), (SELECT id FROM channels WHERE code = 'new'), 1, 440, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ロストマン__bump of chicken'), (SELECT id FROM channels WHERE code = 'new'), 2, 441, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ロストワンの号哭__neru feat. 鏡音リン'), (SELECT id FROM channels WHERE code = 'new'), 4, 442, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ロマンスの神様__広瀬香美'), (SELECT id FROM channels WHERE code = 'new'), 1, 443, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ロミオとシンデレラ__doriko feat.初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 8, 444, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ワールドイズマイン__supercell feat.初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 7, 445, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'ワールドイズマイン cpk! remix__ryo (supercell) feat.かぐや(cv.夏吉ゆうこ) 月見ヤチヨ(cv.早見沙織)'), (SELECT id FROM channels WHERE code = 'new'), 2, 446, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '忘れてやらない__結束バンド'), (SELECT id FROM channels WHERE code = 'new'), 5, 447, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'わたしに花束__ado'), (SELECT id FROM channels WHERE code = 'new'), 5, 448, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'わたしのアール__和田たけあき(くらげp) feat.初音ミク'), (SELECT id FROM channels WHERE code = 'new'), 2, 449, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'わたしの一番かわいいところ__fruits zipper'), (SELECT id FROM channels WHERE code = 'new'), 6, 450, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '私は最強__ado'), (SELECT id FROM channels WHERE code = 'new'), 11, 451, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = '1・2・3__after the rain'), (SELECT id FROM channels WHERE code = 'new'), 2, 452, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;
INSERT INTO song_channel_stats (song_id, channel_id, sing_count, source_index, updated_at) VALUES ((SELECT id FROM songs WHERE song_key = 'one love__嵐'), (SELECT id FROM channels WHERE code = 'new'), 1, 453, CURRENT_TIMESTAMP)
ON CONFLICT(song_id, channel_id) DO UPDATE SET
  sing_count = excluded.sing_count,
  source_index = excluded.source_index,
  updated_at = CURRENT_TIMESTAMP;

COMMIT;
