-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 23, 2017 at 04:00 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `slack`
--

-- --------------------------------------------------------

--
-- Table structure for table `channel`
--
-- drop database slack;
create database IF NOT EXISTS slack;

use slack;
--
-- Table structure for table `channel`
--

CREATE TABLE `channel` (
  `channel_id` int(20) NOT NULL,
  `channel_name` varchar(22) NOT NULL,
  `channel_creator` varchar(20) NOT NULL,
  `channel_created` datetime NOT NULL,
  `wk_id` varchar(20) NOT NULL,
  `purpose` text NOT NULL,
  `invites` text NOT NULL,
  `channel_type` varchar(10) NOT NULL,
  `joined` text NOT NULL,
  `uninvited` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `channel`
--

INSERT INTO `channel` (`channel_id`, `channel_name`, `channel_creator`, `channel_created`, `wk_id`, `purpose`, `invites`, `channel_type`, `joined`, `uninvited`) VALUES
(1, 'general', 'default', '2017-09-04 09:27:20', '', '', '', 'public', '', ''),
(2, 'random', 'default', '2017-10-02 03:11:04', '', '', '', 'public', '1', ''),
(3, 'foodie', 'mcqueen', '2017-10-01 07:15:00', 'wk2', '', ',', 'public', 'mater,doc', ''),
(4, 'travel', 'mater', '2017-09-04 05:15:26', 'wk1', '', ',doc,', 'public', 'mater,pnavale', ',agosa003,doc,sally'),
(5, 'fitness', 'sally', '2017-10-13 04:17:00', 'wk1', '', ',,pnavale,', 'private', 'mater,doc', ''),
(6, 'fashion', 'doc', '2017-10-31 12:10:02', '', 'fashion sense', ',agosa003,doc', 'public', '', ',agosa003,doc,mater,sally,pnavale'),
(7, 'fashionq', 'doc', '2017-10-31 12:12:48', '', 'fashion sense', ',agosa003,doc', 'public', '', ',agosa003,doc,mater,sally'),
(8, 'commun', 'doc', '2017-10-31 12:14:29', '', 'csjkjs', ',agosa003,', 'public', ',doc', ',mater,sally');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `msg_id` int(11) NOT NULL,
  `subject` varchar(40) NOT NULL,
  `creator_id` varchar(20) NOT NULL,
  `msg_body` text NOT NULL,
  `create_date` datetime NOT NULL,
  `thread_id` int(11) NOT NULL,
  `channel_id` varchar(22) DEFAULT NULL,
  `group_id` varchar(20) NOT NULL,
  `recipient_id` varchar(20) NOT NULL,
  `profile_pic` varchar(20) NOT NULL,
  `reaction` varchar(10) NOT NULL,
  `msg_type` varchar(10) NOT NULL,
  `reacted` varchar(22) NOT NULL,
  `image` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`msg_id`, `subject`, `creator_id`, `msg_body`, `create_date`, `thread_id`, `channel_id`, `group_id`, `recipient_id`, `profile_pic`, `reaction`, `msg_type`, `reacted`, `image`) VALUES
(38, 'general', 'mater', 'hey', '2017-10-29 15:17:36', 0, '1', '', '', '1.png', '', '', '', ''),
(39, '', 'agosa003', 'Hey', '2017-10-31 14:23:20', 0, '', '', 'agosa003', '+1.PNG', '', '', '', ''),
(40, '', 'agosa003', 'hello', '2017-10-31 14:36:31', 0, '', '', 'agosa003', '+1.PNG', '', '', '', ''),
(41, '', 'agosa003', 'hello', '2017-10-31 14:41:26', 0, '', '', 'agosa003', '+1.PNG', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `Reply`
--

CREATE TABLE `Reply` (
  `msg_id` int(11) NOT NULL,
  `reply_msg` text NOT NULL,
  `replied_by` varchar(50) NOT NULL,
  `replied_at` datetime NOT NULL,
  `reaction` varchar(22) NOT NULL,
  `reply_type` varchar(20) NOT NULL,
  `reply_id` int(11) NOT NULL,
  `profile_pic` text NOT NULL,
  `image` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Reply`
--

INSERT INTO `Reply` (`msg_id`, `reply_msg`, `replied_by`, `replied_at`, `reaction`, `reply_type`, `reply_id`, `profile_pic`, `image`) VALUES
(38, 'hey', 'mater', '2017-10-29 15:17:48', '', 'reply', 64, '', ''),
(38, '', 'mater', '2017-10-29 15:18:09', '+1', 'reaction', 65, '', ''),
(38, '', 'agosa003', '2017-10-30 16:55:27', '-1', 'reaction', 70, '', ''),
(41, '', 'agosa003', '2017-10-31 14:41:43', '', 'reply', 72, '', ''),
(41, '', 'agosa003', '2017-10-31 14:42:13', '', 'reply', 73, '', ''),
(38, 'hey', 'agosa003', '2017-10-31 14:43:14', '', 'reply', 74, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `slack_group`
--

CREATE TABLE `slack_group` (
  `group_id` varchar(20) NOT NULL,
  `group_name` varchar(20) NOT NULL,
  `group_creator` varchar(20) NOT NULL,
  `group_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email_id` varchar(30) NOT NULL,
  `group_id` varchar(20) DEFAULT NULL,
  `full_name` varchar(20) NOT NULL,
  `workspace_id` varchar(20) NOT NULL,
  `channel_id` varchar(20) NOT NULL,
  `profile_pic` text NOT NULL,
  `signup_date` datetime NOT NULL,
  `image` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `email_id`, `group_id`, `full_name`, `workspace_id`, `channel_id`, `profile_pic`, `signup_date`, `image`) VALUES
('agosa003', 'abc123', 'asmitagosavi65@gmail.com', '', 'Asmita Gosavi', 'wk1', '', '+1.PNG', '2017-10-30 16:35:56', 0x89504e470d0a1a0a0000000d49484452000000840000008a08060000006b4ee2d7000000017352474200aece1ce90000000467414d410000b18f0bfc6105000000097048597300000ec300000ec301c76fa864000020af49444154785eed9d799025495dc7e7be76ce9d999d63d90bd81954080f3cf18a40fd4343d4f008d0103c8240313080d02004010544101043f10a05854098e999beafe9ee397a7aeed903d893dd656ff65ea65fbffbae9fbfefaf32f365d5ab7776bdee7eb52f23bed133ddef5556667eea97bfccfc65d62aeaa55e52e9fe27e7a907442f99d403a2973ca907442f79d22b1c0847a997747a0501e15039fb3c159e9fa6ec839fa1d49defa6e4c5df65bd8d5277bc8b32f77f82f24f0f5029f11da272417de795975e014038545ab88fd2dffc002d4cfc00cdf76da26b5f5f15ac23eb2836fc2a4a5ef81dca3fd5474e7e5e5de39593220d845388f393ff4969e42000e69582fe76ede8068a9ffc1906e31839a58cba62f453a481c83ef0697eead798469e3fb29ae2031b293db19372276fa0fc9903ac83fcef7d949edc4589a1cd143b5af9bc7ca76f33a52ebfc3ed4a5e0129b24038f918c5a77ecc6d545662688b34be73f9b54477bc8ee8ce005d3944c573b7081cb163eb3c602c4cfe20155e38adae1edd1459204a0bf7d3fcc05eb7318fafa7f2c557bb8d0e18ea497da674e1564a8def10aba2a140d793ffeea0ca219a29b240145f3c2be61e0d89ae80ae1eaa6efc7a0218570f53fef47e8fb5880d1da0c2b3e32a97e8a5c80251786654460d68c4e4c875dcc887ab1bbd193118c5b99b69a17f83816261ec762acd7f43e514ad145920f24f1f370e6572741b376e9b404080827d0b743d1a8ac4ec2f4772581a5d209e3cc20de7f6ffa9b1450201311485d91b29d6a746210c5bf6a17f52b94527451888af5b406ce7465d24104a99a9dd2e10ac85f1d75139f584ca311aa907442b622b81616b7ca032db997de8f32ac768a41e10ad8aa1c0449606227eeae7c9292655aedd9f220cc4d73a0604e634f450747e60378f38bea972edfe145d209ef83f1f10018ddbaeae1e96a1ac5809762ef34f1d55b9767f8a2c10b9c7bfe2361880180f1908b61298ded6d7cf7efb732ad7ee4fd105e2d12f5a40ec086ed876c540d8a38dcc7d1f53b9767f8a2c10d987bf601a0cab9b68c4c0c66d473d20ba2f651ff854a5c14e5c1f3a10de2ee3b32ad7ee4f910522fdadbfaa34d8f49e708160c151d5d7cf3df625956bf7a7c80291baface4a839dda172e10570f5162788b7bfda3eb23b5fa194d209c2225e6de220d367f6495ac41840904662bf5eae77cff4e2acedfad32eefe1449209cc202c5a77ed46db0a3ab65a5323420f83aa50bb751ac6fad5c1f4be1e5ccb32ae7ee4f9104a29c7ccc04d66246b1e968a966c4d781c581e5c1f513677e919c5256e5dcfd29924020f651474bc50737115db93db871db1103610f39d377bf57e51a8d14492010a7a01b2cf4492999b6deaaaebf9a728f7f59e51a8d143d209c12252fbcd5008195c930bb8bf2a5d798c8a9f9feeb23e55022450e8872fa298a8dbec66db0a36ba814b2435938fb2a13890dc7356a6174910342e22054706d7c7033391df41f5277fc89ca353a295a40940bb22f5337181a2f34eb00d91352e23f7c45651c9d1429208adfbb4af3037ba4c1304f503a1f6e7751be789b098c890dee93cd40514b1102c2a1f45def514faf0abde7114160e3b62306227ffa80d91c9c38fd66f65fd32aefe8a4c80051bc76173fb5fba5b1e0f4c1f90bb5bb60a57908ab81cbdcfb119573b452348028e72975e50f4d63619ea0e5ad7b0de4465b6f7481ebdb24078f4431450288fc778768fe983b5984a166e1ec4de15a07be56f1dccdb22e823c643f46e639957bb452d703514e3f6db6fd43eecc6488be03c4406467dc9de450f2e2efb1cb52567710add4dd40947394baf3cf4c43b9dbfe6f0bdd77006095e9ea55947be4dfd50d442f753510b9effca759c48223993fb53f7c18f87adee9ea9decc0dea9ee207aa96b81283c376946159004d28639ccd482ffc03e8999ae3ef123913e8cac2b8128be7c510253340c3810c4b9fc9a0e74152cbea6ed3f603413e5d47540145fbe4c0b13af370d8450b6d2f95b3b0383e8b027a036fbf03fab3b8966ea2a200a2f9c92219f6e1c4c2317e7421e62fa75e59004d9203f77fee1a4ba9b68a6ee00a25ca0dc63ff43b1a11b3d301466c39f8df488afed3a947afd623f95e20fa99b8a665af14094b32f50faeef7d1fc31b5b996058fbf1353d355e2eba33bd2a7c62c4c7c3f39b997d49d35931c191a23e817c72ae3709152fc41d92d5ebc7687f842c597ce51f1c539f7e74b17a8f8bd2b127483d3774b8947649e0579c2919563073a3cffb17281e082175e9ca5f8c99fe5c6703d7c08e63bd4a0977ae23cec19caf8cc4f059f05c1160ce0e22032cc9a22842f7df7fbe51cedc4e95fa0f8d41bd9093e44b1e19bd8cadcc043d75d347f7cbb403edfb7a522fcffd856fedb0e39660016293672ab80887332e3336fa2d4a5b7b3b5fcdf8ecd94ae482050b9997b3f6ace998410e50ce70e267c4960800004fb2866c889c34170cc31c38ad0fbc273272873dfdf5272eed7d8b7f93e69681d9cd3511d594b0b277e488e3cc03a4e98696501c1e6154f587ce627e5dc055d01f0177014b12c582d150c90cf42e029cd3ff1551e7afeb13cf1d78eba8b5df50490f1fd186b81bb1ef823f1fef5141fd84089818d94608b27e2a1736270b358402ca2c579f484ae1165476c07ba2d7d1fe6da6c5532f7fc75a8cbf02b03087ee230fb97bcf4fb1e5f01b107389823d4409756c479ca69316a530e9e4c6cddd3f7672bc60dbfd0b79a12c7d7507a701d654736527e620b15a6b651696617954fefa1f2ec3e72e60e9273fe26722e72992ebd9a08f32708f303ec108f6a10f687d555a8cc9fc1c6209cac8bf332b3d37b05169337df8fec3e774aaa32179796190847bcf6f437fe82fbcbcab94d109e0e580589895c2618300781a018ff81e8109efc78df2a4af7afa2fcd06a2a8dad23677223d1f416a293db894eef229add4334b78fe8dc41a20bec040382cb0cc1159cb78de5f90633abb88700a1dbb4e746e073e49f195175bab8b44c403008ec4167eef9303b4db7782b9a2b1f2b96782aa402822aaad3e27c01228e11f09be985a3ab28c3101487579133ca5537be86e8c47aa2a94d4433d7119dda4174e67aa2b37b1986fd44e76f64106e6610b83ccd82d048eafe1015a6ef4bfc9b10a6d4971608366b8843cc7ceb83141bbdcd53d170dc92c3d7b9b10ca8b06586c18e8e8200427660159501c198d2f86aa2c91a309c3be0b50a5711fd1de25a0bdf271e1abde886f77be49fee5715dd7e5a1220b0f7b1f8d2794addf1a7141b3ae8a968985e38547875c1923b8d7e71def01992a33cf4d3f7c74a1d6710462c100c0ceb1806ee260406ee260261601f21e4e82d23be5f58315d97a92b7f84da762bbdcdd45120307cc43e090ccbd0cfe91b978ad620701fbd6c7e824f6286d94a997b64c147f080a035b196bb8a0dca67d866f90cba9be89065b0c5750647d38c827828eae4afa9da6f2f850e0486405880cadcf3211ea6bda1ca2b47d780bd0d789bcd4a0141c4f761efea8612c7949fe087c158077f57c14363b10edced5dd23e43876080f89eed588d30a6d643010296008b3e78a51166e61044a22b550b433778c632e5bcdc5d4390f87eec5d59b00e85211f080608e5484e6f66ebb095adc3ceca88c23891da3a04e415a2f05099e05fb6c2883e5f4c5a1410e5d4933253074b10f4b63b199af1cda2a265897a399dc5460210567f1c6327b2ca6fd09a0010e82e0004ba0b0d84bfbbe890ef60696500e194654651ba045581b630bb86571298775c0182950a8216df5f6ee60653068c2a02bb8bba402cb185e07bf6acc60e1d90e1fc62521b4038947bf4bf652bbcae3cb104fd1b64fe20776abf1be8aaadc14a07418befd376d0ea5a08741932dc642066b8cb38c5409cd9ad7c084c422d9d0f51bd1b3da6daa9bdd43210f9ef0e7b6058e85f4f79cc28621a56fb06dd02814f1ef3cbaaed43d41872ceeac9a80ece3f7874d8335f8208f4c5a69680c0d90b18dae81bc0a24cf91c171e4f020a2e7d66079f8825907d20699247198140409e6e035602230d6d25d43cc4a50e422116ed26b3ce82852eacbe2e36b50444e6febf339585a14e698efb4b145816682200054cf06cc504c34a64067c20688db3642e42af5f285fc20f85b61461761f7c9f98a5d4a17d50f2dcaf93534ca9966a3f350d84937b99adc30fbb15c53e436e9a4de4251e39a0af94025b5084315fbf1ce28ab6df85a1a1089ca9142854d751130a6b2d037525f5643f34561da19b6d247ceeca21992fd15d1b84d042445f85919a0602d14b7a693aced6c139a7865752501b8a2eb7125650ad2dbda8551a0e82c29db574a6b80b9dda42c5135ba930b99572acecc456ca8c6fa5f498abd428b44d4661989711b11f807d2518f662889ee5d10e9c738cd2d02d00006c05c06730bbab2d1884c82a09940929350d44ee3bff616e2235c24f033c69906fa0884ad771d8b38ae817e21e127d2e1c79763ae178a25b491e5f4df1636e200c2c282c4bd0f75b915c871b1f3f83fe0ee1c41c44a3e36c4e84f22d36350d0426a0f44d64c6d934020881420111d4757423146c9af124da955e4b68f4761b7e31dff5e8c83a991444bc263621c3922f2658a67920eef9b0b989ec040fb3e0305559093f14017de54a1703614f61372b69607e92d1b52070061623d5bf8632836b293bbc8e72231b2837b689f2e39b293f711de5b93bc94f6ea3fc89ed948326775076723b65b86ed3fcc0a16b49b2254e0c21a40ee1746e281de649ea8184b8cecc7d1f6fdbc16c1308b610709602a1e8f2ae838140989a5dc9b5a4bb0f899a1a64ff821dcff2d86a72f44aa85efc82b329c352b5220a8713f31526928aeb1043545d7ffa815292703a09a573c3e8e05bc0cfc01019dd1bfc0af3825988ad46fa1b7f296107ada6e681b8f72326c32cba8cf35c180f14beaea35ba10010d65e4ebff074020204cb00008f7329205801330202461d98b45253db188e4abd01020b004f3d05d415461941c267f97b0806c69105c67a1cdd48b947fe4db55ef3a94d20b6ba74a3609895f35b896ef627b8926b5908800047b26a8da36af8a927aa7c208835c01094eb4743500b8056c5f78d99568c58f4fd222aadb4f0806ac1e6520b407cd464e402c105d45034e54f7409145cb199135e1f024f1dba85e0d808ac6ba869eca0b9083bae12f5222074a81e0005cec21a74cfcc80d2dffc806ac1e6529b40b039c4a44b44a1b04719800143cc2a1004066b4da3d66ca559d78055e03ae874d9190af8187aae02bbbe5ad9e5d502107f5301628c81801914c708850e80c23849f5a0588960788f0f4237116c1958268cce5ecf40e414e22a2dcbb05430283997ad45ba164fcc6b0b888c0142f58d0dfd89ee81c25ef1847235d732b475d00ea46f2f061e12d485ee26643a3f38cf4ec8f6255a39d3a27920ec89a931368f3089672d2bd12e142ba90b61736bbf3e09f30ad87f110804563b8342f0cd12b8651d50d6a52c2397036f2234ed75cf87542b364e8b00820b2e4e53001441fe441014b2eeb182ac05fa5febf8e2e681f075171e20b8bccb0c045e59d96c6a01888f558018e53e5326585a8582a5a1d0f31481d662b9c038ec31b500a3500b08e9326c0b11d065a0ec32c4e4322e71996cc7b8957793b700c4c74d062e10ec49b70c856d2d34147617a2adc53280c14f1596be17aca56f296b3d1fa295788825b412f083b0935cca80f78a3e33aa5ab1716a13087e2a50f07a50048d3c50399e2e0450b04c17b25c60b8d7b7cdac16d6261ac756063896f0aff060a0fc9d8c9cf28bc196332dd406651c38524e3eae5ab1716a1e88fb3f612a29330220b8bf1428b8f070a40084389901506847f302a0b0bb104011602dfc6078ba92b02ad4bede61090c36fb247d42285ddd08ec9a50f82d85ee3e747982ee6bb1f29e9a97bafc8e96563fdb0702856e060affe823c8afb0ad452330aae0d00aaa1cada0cf5bd7e3eb67ac58ca20010acfda452d28aaba0fae17d485584b2e3bca2b561165d36509bae736a49d6215393e7f7c5bcba7f6b70044259e3233c2fd260adc16140a8caa2ea401181e38fc8068f91b5dcbfaac51e55a85d983816740f885d07ccc5ad60fa753135532f250d6c20643ea021683cb2fe54519557970afdca8755503040821f9b60f94bafc07d4ea9143ed038161565b50e049d1d6c2ee4234185c498160d483a345996bbc96ca176ef14c4435238081384b2c74010e7427b01e18a2e687d7506e782d6586d6517a683da5065d250737286d7435b48992c39b595b28357a9d84d4a5277648181d7c19bc5e12fb5fd1c838640d5d9a6c7ab2e1e19f72cacc85db64412e764c9d74c3c226aa76f679b600c4274d6699617e0a407f4328585550d4ea42341896b510306ac1e103a425b9df77b8921188a2cb1524580e04ad60cb813f940dc352c001c713b111f8bb9ec30843b8965c93ef019365d80383784fc43fe0a825fcc406291b042836fa6a2abc7046b55c6ba97d20e03cb505452d6be107c3df95f8e1508054415243fab3fabb7ccdf478c5f90a121688b227b86c0c6fe1d41e092e0efa5c2349c36a69702c80a0a0efb5ac236be518c7c54460370fc4037f6f32ce0cb30305c7096a088502434351d35ad400c36335fc96c30f4873c2815f80a15e43c031cb4eee1010526cda6129823e8fdfc981636c25707c40b21f878e7197c1758483c772636ec81ca2b00b53dba930bd930a33bb58bba970728f287f722fe566b89be0ae223bb59bbb8d5dd27d203a1b4727c02a6004e486d0f17d5851d7b6f0025b9c95b998d43410d9073e6532ce70df284e9340d1c852b03414557e85cf5a3402a30a0e1f248dc40095cfdf247d763d18e098010684cd238adafe1bbe87c6c7a803515388ba2e8dac26677c6dc0f093eb03f560461a5c56940f65c27d0350f6638c4f603b95e230c24f382c134df015e4343af62730cf903fbd5fa0f10f951185bd984343da0482bd6914ba2928ea7421b6b5a80786070e1f2002492d502cf1e78aa7f7d5752061c2610df0f426d8f1b3ff062b0008b4235935bab06322500f283fca8cb2a26c5206be4f40003fc640a01bbf813428b6f8f7985dc53475c56aac9695e976530b407cda548e0081c27ba0a8d57dd4e8426a598b40307c7098d1895f162496ca73378a63e80944b5041070886861e67a72ceee971180f91b0b238ac045aec0994a2e3b1e02941165128bc0f781ee0d20843d2925601c9648719403f71c1be691499b2f995d04103cd66e068aba5d88b616b5c0f0c15113104b1a0efe77f9ec01710a6bcd40a23b40e3e7a7198439ce97f34138bcfe3b2ab8713c045b0603039715e5b3ad02ac139cd9562d422b622864fd6248bf86bab5052d3b350fc483ff6032c35e037756ce0f850243438188e3ba5d482d301ac16101a221c1cf73375279763fe5d9e4c34f58f00dc720388b385a189b8d4aa7397fb936ae7750ac03fe269f63c14708868115b4b0652c830503463802434043862986027317ba9cc9f3bfddd6869d4500c195510f0af12b0045bd2ea401181eab61c1e103044f779a0140639a6ee16b0a00ee5b01062c0136181579d4e05a03750db99e7bfdd2a9ddc6899445ad5aeb17feae026544b98cf3c8f725dd049cc6dbb9c13a64196c31109e93fba77f829c4242b55ef3a905203ee356342b33c815221b5182a0d0606828ea7421f5c0303e860d871f10c87db2656888c3c5b9f113831b18902d62fe8b2777cb19d3f2591f0022ebda85e95da61fc610321006a8ea6c082e1bca22d681af695b07f119021a306c3110d8c8a31f081cd4decec9b6ed0131800ae12724080a8fb5d846cef4562a4fa31bf175214d83c132605870d8520d5b3e730339687cfd3bbfecef88ecebeea3e234bc7505449f0f025bfee05a94c900c1c079805802eb008985b8c5b2103fde610bf1edcf5a40e8851c0505fa52408133976c6bc195559cdc2cfb192b7e85b6160a0cbb1bf18051038e2a40b4fc8d6d2be0f3b040beeb964eee325d068699755737658716970be09b2e83af03f0e0d3789cc980060c5b0c8484dfab36c261b1e41455eb359f5a00e273d54088fc5078bb90fcd8464a0ff267fc5d8801c3b6163618b5e00800c423ddd8d50dee95ba16ae2be23c38dfc440654492e6e1662010fe1106ca8432e01a00507c081ee998a1e6d258093b6c0e7b71db49ed0301b309358002bb9ee3c7d670d7018b01286a81d10a1c906a48034913328d0fd9d7aae4835dd9badbc0d35673938eed4778ac045f5bf664b095582ac792ad8384ffa9e1b59c37f5fc8c6ab9d6520b40fc63050854122aa426140a0cae2ccc59a0824bdc7548c51987b315302c386a02d28aac6b89ac7c38dff450e5052580428263fc13536d6dd4e95cf7616f3fc40257bbc713b605841c080eb389e19706c30345c55aa406dcb900580ad7d9540e673d308cf369c1510508e46fd866e4bf06cbce83f374f87e10c3a0cb0bc1a74017e299b1441dd850d896025608be0a4636e264dad622c4492ab60e889930c3eda3ebe5256deda6e68178f80ba672cc09f102052ac50785652df0ca217c0760e86ea47930eac0a1e56fdc7a0afabeb936cbcad799d926cbfc8877d0e58660edf471008043622d8d93c95611e54239703d00086b217e8502c39ec6365d491b70300832b298bbc933132ba7d1b531bad0a96920f24ff59917a3c1847a4c6715142e180e2bdea78641fcd33961399c75c1a805076435a0515043fb15f03d5ccb736dce0ff98adcfb284e6ca624c3acfd0a5bf89d5ef9845f951f594ba5f1f5549edca47c26be0ef23160b0c5906129fc0bee4a64240238301ad10b5eda7ab054a35789ff86d54f1c1a629f988737039662f7a8166b2f350d045e2e2aaf2144c6fe593c3f140a8cf2f83af9acaebce2385b0d9fd3e90543c161663bfd70407603faa51bd9afa0cf42ea9a3e08247f0d29df53617c9338c6bae26b09fe868604079025fbd74ad7034b931ddd4cb9711c25b48d0a533b2426029366c5537ba9789a87bc67f65169763f15670fb00e1a15ce1c90a5eefca97d949bd92bf11238bd1691527a88092d8cbdb6ed28293b350d04de4e8b1799ea82e7062d200c18e84200850b46696cadf4bdfaa673c36c39c4e1f48f46ea590dc88603b21ad180d2a4aa1a5f4b0300b9f7509cd8248d1a681d58281b64374c33d2e054b45a26948cf07f91fabbeffb1eb1d58e9ffa3979237018a9692090ec98081cac1538d76ff915c51144f7546e1e8770799dce3a6004598eba90b42aeb7a222bafa92d941d5eef811942592a6fe2730363007d7e84adc0d07aee5ad651fc78e51d9b76d93b25bcb60a87ca86955a02026721da6fe7af3d7103719f3ae4fa0f5aa84c6782ad8499e10c00c3cc76d68303f237682bf25dcbce87f3c77b37eda7d21e61980d3b28230e2cc5bdcff0f7607dd85771d85f289fd92b2ba905ee0ef230f3d37b249a1a1347d84483f32712c30892c52973eae5ad96b00d0fbf47f81c826971b0586a7cbb1c3286eb2c58efed4c9eff4d798b5158a9252090728ffe971c68859b41a5d53e6ac7f5c4f58dcbe7b9628ba3daf1b447233618b5e0f00102f91bb619f9af21aae491e3a75dc3809f817310908c2cf8bef13d581c38ae98e33033957a98c94ea271065d87507415e2bf695d51b27f07e9cffb46169543cf37b7b477b3516a19081c7597beeb3d7c3395a71f2b8341114580457f462bc756c33f1af182510b8e2040a0a006ae25df77713debfa0ee70b6750df2b22a58261e732e0def13d581c38a83292b8418d223082e0d143076728d313959d66b221c729ab165a5c6a1908242caba6ee78979c87a86f0a4f3f9e26389b80030b43f8bffebb162ad9331a4117d2088e9a80d8d20d5c4b41df812ad72e8eb17550fd7edd7888bad6010b5b6c1d3ab9f40d2b21b10f6aa99b879b78ef5918a92d20909c62529cccd860e5b5445aa854f1be55e5da42453b6315c7d303871f8c2a382c403c90d80a6e6c23fbfbbe6b17462abe8367aec52fdc2bbe0fab03df01935e325d8d954ecc4a767e510bf310da97c074c062c3ef756a1b08497889fbcb976587711018410224f2a61a3d7721f281e181c30f481024edc8baa612fc1b0d71e3780806023e89014277170a884e2f68b17fa16328e560b110e620901607844ee582cc90651ffe1781038b2b0be387697e602f3ba0d69bec95c46b67ffc2c41b5481e183c3d3ad0440d296fcd75b4b651e42da1369355fb1a48158460bb1b281f024478641e8d3708a2a5efb83ae2571e697647bba1f0cf814a87871de02ad4610204a558dda840057d0b59007e7693bc28023c85996cfc2ca787c08b566a183633a1c2db532bb8c161220293c374589b95f95a192ae7429102bce958fc6001cc69933702840aa2081821ab79e7cdf97eb56f241deda4a408016c367cf68039f055cf0533ca30cb5baa997bc3bd56d043a95cfab9a5e5c5a322074c2b1fdf967462879ee37aade070e010e34089c3ad92ac74f683020b674c33652d077715d757d2558051b0a01967d0a8ca0ccbd0026b112dc6dd49d87e80c14f6cbe2dc53629671d81946c27c067629e318ff8589d79bc92ebfd01858824683a07b0124983646a3a1711cdd909eeec62ffd7725fd9d3ac264141c4bffbd0014b164fc77d9cfe9712eadaea35350544d4c6d9257678695960d884a72d8dcbd488567c7297df7fb255ad85d55f54e7bdb42c3e8a12d1a080d078b8286023078923534705cf5a11e81934cb5c4e0e0f3b81ef2409e9e7b5079637d06b39b582677105d6efb133a624a3b9966e631a0a19b11c380507b7b7f6a62ee2d320510565a014078135655b1d49e7bf48b94baf3dd3262c1eb83fc7e472369686c70e0a7001ed9b6cfd606160710e1e84103120b7e0c04a020c085cfe23a4179410248df6a4af4afa3f4f04659eac6d6ffd2e93db2a5d091184be56c6a30b8819b167f0751d5f63a466cf8e6d05639755a7140f8137c0e1cab577cf12ce51efb1265bef5414a5e782b83f2d3b43076bb0c6d051615bc13860426c8020ac2bf833e5f4bf2dda3ab1994b5b2ab0c3bcaf1daa4f4d836ca4cee94d806c438e44eed93c3c2d0e00568f64623797bcef41e1962567678f375076f90a0a5b0d38a072230b10325a0649e935dce8025fff471ca3ef2af8417bd6049187b1b13a7df4cf1a937323887e4dd967845b5bc6a127323210214966c088d7c9f8130aa7017b41cb73e424cdd09443309d0b0e38a2e0843322cdd63f2acf8d205991bc93f754cbaa5ec439f97639be1dc022478ecc9f3bf4589b3bfe20235f32617aac937c8641b4e6981a90660b1c17dae850268fd3b79d4b45de65ae68f6d15f0100e8fffc706f7cb138ddf2308b69e7f54530c30bacef4ddefa552e21155c8f0537481584cc210ae5c7081624b04a89cdcf764b2ad9c7956de812e80251e96c9b752ec5e99182a5ebb53faf4e2cb9704bce24be7e4ff380dae147f507e0fe739ffc457256819e776e160f2f45d7f4ea9abefa4d4a5b74b7708eb863807d1c5b73104efa3dce35f7641086978592bf580587189bb01343ab6f2cb76fef0bb857aa907442f79520f885ef2a41e10bde4493d207ac9937a40f49227f580e8254fea01d14b9ed403a2973ca907442f79520f885ef2a41e10bde4493d207ac993ee7f729efe1f5970026e9c0be68e0000000049454e44ae426082),
('doc', 'abc123', 'hornet@rsprings.gov', 'g1', 'Doc Hudson', 'wk1', 'ch1', '3.png', '2017-09-04 09:00:00', ''),
('mater', 'abc123', 'mater@rsprings.gov', NULL, 'Tow Mater', 'wk1', 'ch1', '1.png', '0000-00-00 00:00:00', ''),
('mcmissile', 'abc123', 'topsecret@agent.org', NULL, 'Finn McMissile', 'wk2', 'ch1', '6.png', '2017-09-06 05:15:00', ''),
('mcqueen', 'abc123', 'kachow@rusteze.com', NULL, 'Lightning McQueen', 'wk2', 'ch1', '7.png', '2017-09-05 10:08:00', ''),
('sally', 'abc123', 'porsche@rsprings.gov', NULL, 'Sally Carrera', 'wk1', 'ch1', '2.png', '2017-09-01 03:00:00', ''),
('slackbot', '', '', NULL, '', '', '', 'slackbot.png', '2017-07-03 06:00:00', '');

-- --------------------------------------------------------

--
-- Table structure for table `workspace`
--

CREATE TABLE `workspace` (
  `wk_id` varchar(20) NOT NULL,
  `url` varchar(50) NOT NULL,
  `purpose` varchar(50) NOT NULL,
  `wk_created` datetime NOT NULL,
  `wk_creator` varchar(20) NOT NULL,
  `channel_id` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `workspace`
--

INSERT INTO `workspace` (`wk_id`, `url`, `purpose`, `wk_created`, `wk_creator`, `channel_id`) VALUES
('wk1', 'odu-its-students', 'Education', '2017-09-01 05:35:00', 'mater', 'ch4,ch5'),
('wk2', 'prasmik', 'Office', '2017-09-08 08:16:08', 'mcqueen', 'ch3');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `channel`
--
ALTER TABLE `channel`
  ADD PRIMARY KEY (`channel_id`),
  ADD UNIQUE KEY `channel_name` (`channel_name`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`msg_id`);

--
-- Indexes for table `Reply`
--
ALTER TABLE `Reply`
  ADD PRIMARY KEY (`reply_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `workspace`
--
ALTER TABLE `workspace`
  ADD PRIMARY KEY (`wk_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `channel`
--
ALTER TABLE `channel`
  MODIFY `channel_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `msg_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `Reply`
--
ALTER TABLE `Reply`
  MODIFY `reply_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
