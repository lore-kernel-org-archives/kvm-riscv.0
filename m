Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9125C606A320
	for <kvm-riscv@archiver.kernel.org>; Sat, 21 Nov 2026 17:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=icrSMYhC;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=valinux.co.jp header.i=@valinux.co.jp header.a=rsa-sha256 header.s=selector1 header.b=BfY8N09y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rQxGUtVAXmpL7kun000ymWOo//VHMwYifZW1dXUjgfo=; b=icrSMYhCMeCwOW99Qs0Y5i1lvE
	GP/oq0GwW+K5ObOr4QGbjxHGxyexmhQjL3L8Pr3i85l8SCpbDjV3m0Q1Wn/zOFexEPZwUwMdLvDyT
	k+jcvDOAyOFJMNSOjBOJp95oTgMcF/eZY7bWUNUcIc6MKqhJLMb3SRwCAEvaDaEcGiYilbhLFlMIO
	5ixoj4dT9dYKm7l8/fU6r8ZtHA3fR36ramJVMpV2j9yvkhuRTmBCva2eIa/O8nN4woDFGaYd1zHqx
	9fEhIRBMcq68EQR4acjGdXQyYi/x+FqonGmbTiu/GIfpa8pVj/ODLc/Rd38hqgKfOQPdKyLHcCjz+
	PLigeYbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUp07-0000000008O-1FcE;
	Sat, 21 Nov 2026 17:35:47 +0000
Received: from mail-japaneastazon11020086.outbound.protection.outlook.com ([52.101.229.86] helo=TY3P286CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUp04-0000000Hb66-2aUj;
	Sat, 21 Nov 2026 17:35:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D7rdvCa2yRkw7hyZcoiOeq9yZlsjNYZf1kPv7P/QB7prpQdLyKxHtJn85v4D0XLcUQco21HkrDTwcnbS8tsXYb86t9lBBQkXpHi9B3RjP+piEkVK+78+sKCrslzMrDNumXWeYisydo9n1fjaAbZ3MMaXeTrj7+daeetM+fpW3cJWRzL6MOBVrb13WYOjEw01/n9cIJiKdtcDP3Z32CH7tsMS9cUheDqhbd033pYpR61HsSvbV3Kin2ogxdLESx1fp+IwpE+sgzPdRL9MKz69JxMjTBDb363TZnoZnWRq8UMNDIdhKwP11e6xdWOofZAZQKbDhiwtP9TbwZSO2PrvFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z1G/cmsh0IqNJWIGUS/Bl/8bRYsPdAa8x1bbEo4UEwk=;
 b=mlwcREaBlilqeQD1E5hPOUCa+F1Py/qwgT12wPg3FZVY/AaRuK4La+b6q7iarjXbcjNUpeW9ZrMdivKxFXl2MeUpJuuz37VKb2uy5EMYX4OgenAwxe1uKUuOEASVU1On67gvnkivTBIk2/qZFMu/8gtb+i0+kD2TyA6xzwfGLqYSPsm64lBw2L3AZC20anapl+xMt+SoYmT50KUPNlaE2gQq6dbndIlNe3p2A3tWvy9VMuo2bKzWUlC5w9T8V1yFXI2PFPMhIISy4l6LH05bDSnQ/eV8AFXjDy1JFOt0Hd/QGku+aLIq83AHP0dHqx1of1/ltpW2j2B8IHhjNawy0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z1G/cmsh0IqNJWIGUS/Bl/8bRYsPdAa8x1bbEo4UEwk=;
 b=BfY8N09yX/P38T9WJDGax5ErDxxNhRwRbdjeZhcZyjmya5xUVS0qxO027b1zkHGUfJifnQXFy08FFPotLNMBLKXsJhyB50OU4ylqslVQGvMzknmtXrr7NBG7AiDqVVfvhtXrUvCca7zIMGquDd5KU2hxL9+o9SuA+tP/jDObh6U=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:325::11)
 by OS9P286MB5134.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:30f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Sat, 21 Nov
 2026 17:35:34 +0000
Received: from TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
 ([fe80::cce5:2aa8:53f9:dba9]) by TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
 ([fe80::cce5:2aa8:53f9:dba9%5]) with mapi id 15.21.0639.012; Sat, 21 Nov 2026
 17:35:34 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <andrew.jones@linux.dev>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Bingyu Xian <shanbeeyoo@gmail.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] RISC-V: KVM: Skip steal-time updates when run_delay is unchanged
Date: Sun, 22 Nov 2026 02:35:26 +0900
Message-ID: <20261121173526.892344-4-den@valinux.co.jp>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261121173526.892344-1-den@valinux.co.jp>
References: <20261121173526.892344-1-den@valinux.co.jp>
X-ClientProxiedBy: TYWPR01CA0004.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::9) To TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:325::11)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB6866:EE_|OS9P286MB5134:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b38aea7-29bd-4fee-c469-08df47f5d8e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|10070799003|1800799024|23010399003|18002099003|22082099003|56012099006|261028144727099003|261102123227099003|261022105027099003|261021123027099003|261021121427099003|261026135527099003|261026140227099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info: CmpLz97VZYwGckSXgOhzhxDpznVIrvhiC7iditlmnAxvCh2K68ugiI/aX7nlTUcbCUozDsJJrwL75O3m6h3aDlFVPNlC/Y85B5G9MmoJy+PS6EMNoLZywKvGF7QXkBxta36MyDOCVQR/4Qf/LzQxaceKyH6a5vZ0DWMZBKDehsz3CJuTsJclxq3qlBuPeSJ4tVlzTQzeeeuOB83D3kGJBdM5qknjNww8Gc/W6fJSQVld0DW4gk7cgCtoouy78tpDjD0e33kqlzeTMfpm+Czz8AlAAZc2FqAkRv5jhJr2+LtAJxMRiYCwGsgB+lLy1KH5QQx7iiqzpfudYlCIcC7cQvTGPTiLVsNv3EI6Eb9b4KDQJYpK8Ip9anRNoqXyF9DrjKBLROOdcCJtygZ9ejwxa3O8uj4mOM0Y0s468yYNo3RqgdQrYZr2kFnZVfl2vxZpl4gm/bkRF5Z+kpM9jEyEKvtXbXCqbHSmXp0MEtrP/KGp31i8a31ZfgjffchcKHpDqUc3SyROa0C7Wfk/FRUiBPFtP29liBwbpzAs+7rf3mhccUhXKPJ3JG0A/Cus0BkRFvS7SE7lv+wTXxqPy/rR0l7S8LZpqumKfxe1VTrLFSZDczfrwWgadid0MO3kXpKi
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(10070799003)(1800799024)(23010399003)(18002099003)(22082099003)(56012099006)(261028144727099003)(261102123227099003)(261022105027099003)(261021123027099003)(261021121427099003)(261026135527099003)(261026140227099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mZbFrgShfsGj63Ijd418GJT93kzuOSlQ8Sl8bqhkEekvK4C5aX2sgd+hRytr?=
 =?us-ascii?Q?tPPAbw3L8DnD+DlnLFXloo3RFIJmxSwSudvJteISUg6TzvweZoC1EOKNBb+T?=
 =?us-ascii?Q?95nfjop6mJHNG350HKcuCzllZkPpu71LBy6pEfXMqL+t5PzoTCQy9/uSWGt5?=
 =?us-ascii?Q?PsB3R44eQu9qyEkeFj2gjGDiq7I/R9kXZeR86083Oscmgv7Lq5q7HYThjjMf?=
 =?us-ascii?Q?zECjjwoMpBUpR/xt8+xW2JhaisxBOU77rVbVe+fXixLTLpixEeyWjsZliIik?=
 =?us-ascii?Q?Cu3+QAl5savSsMIc2ZhUGEF/h0xYw2mX0PYN9qL2shv6kF7EZHaRqA9RFl4Y?=
 =?us-ascii?Q?bkgzyMlDVHKLjQgIo6NLOPytDqROMqTcvOvgkxI/gfv5tT6DdtzpY/73NT3E?=
 =?us-ascii?Q?u254zzdUVEzq/aY52CmOVSP2J5sma0p2agMvmjhlr/29wIP7i8fCsMLPghCn?=
 =?us-ascii?Q?SiN9VvTtfmZEuNI9yT4app4c/CVqc8wDTi0lzxPjAnU20eWZep8eLmSp6/ob?=
 =?us-ascii?Q?vid+iIuHnAoFSw6hbxMeUD+di7/iAAV5gkf2wZMfH6fefxfAqDzmuV1SlQi8?=
 =?us-ascii?Q?MnMpr+RulwFIWODFkW1aayFuLLXICRjNYFO/515NqmqvGslNiFjQ7nHn7xoT?=
 =?us-ascii?Q?C4o8YdE9FqY9hwMqOsSag7+o2FHTOC4W7WIfhnUh6rRihskAdLy7l6gDWyyT?=
 =?us-ascii?Q?pWkHmoBglpIcxn+VmxbTHkHgAoQUoIyMKRGSthKOEiMHDC+M2+UH111zfQcX?=
 =?us-ascii?Q?Kjx5itrj4/co0SPr2K+iIbT1dm9vusQoeT5fUderODMWMMM+QINVcvdKO/kW?=
 =?us-ascii?Q?GAe9EP+sE2iEwwFZ3zeq4BFG/sLIp7GnXKg0VDeyfax7DnXgshq0SOCm5vQJ?=
 =?us-ascii?Q?mhKi+DZmIeTDsCIxm4pcqdb1VcXlVkJ8XR2rZhowikjrgjtLdjh1bbEmpxdP?=
 =?us-ascii?Q?CWDYOIDwQBzltC4oAk2+OL68M2XAhTLv21WkXaqAjx65sX23hnCx+e3JdQqj?=
 =?us-ascii?Q?Ykav6Xw0GJ2fBQUogOR6/cl1Cnur2C0cH52p1DgNNUCtxHShp+kh/Z6RJLvX?=
 =?us-ascii?Q?rjFeQis40BSqX30eJxnKCqB6t5uZDaTALHmYOnzGOMRm0uetAghfKn6ikFcY?=
 =?us-ascii?Q?AV6oneAR5MqAqSrmCLr0++Vadnhm3bd1vwn+XgnNFRSoDm5OSJDIsmipW+ap?=
 =?us-ascii?Q?k0P4IoSoEjtf3KTDYXyZvzbv7bvDinQrw1W+fNcQd3vcKb6SaDLwlFPXLGGp?=
 =?us-ascii?Q?Sym4Z1mCll8e8CwIhevFQ3hCZlYGx4JX8x66i5WRyaICdx56OC5K3qYpDcbd?=
 =?us-ascii?Q?mOs/djiQ6+qfc8AOwSY6ycmk65D1gTO8F6xHl1Up5r8C/hdtyeWj3rBTyJt2?=
 =?us-ascii?Q?dKeEqz2g0iC7fl4Rn0jKPwIf36aYMVet9KoxiPafQKFuKAvXl1jl5Dd64jEV?=
 =?us-ascii?Q?6XYPj+ecxmX/j+05Im4chgSHYj10Uqg03sqejgYTOHF93NlNGtw2hAF0JZS8?=
 =?us-ascii?Q?lHyzGkCwxC87SLg1u8V/W9ADC+8KRjSG6AjCke7qkEaFuAvCORNDMxxLkPDY?=
 =?us-ascii?Q?qN+ihJvxC1rwsBlKSmDz9DASmFobck8bGpCRukv0Vv9VLr06BQDrpEkHHzW8?=
 =?us-ascii?Q?kEec4jIlj120subgdEf0u+4Vk+UZ9uH34AvS7XbDsYkWd3o/B8qhijUwPLa8?=
 =?us-ascii?Q?Y9WDswpxaD2qQrLKpEjSwLL3b69q64L59ATJXIo/vtEy4BUKObrnwYBpTCDv?=
 =?us-ascii?Q?p7YEV8THP8tTxSiK+lLVXMmSh2N8P+HeLkpGUIocd4RAJpVSzwdy?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b38aea7-29bd-4fee-c469-08df47f5d8e2
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB6866.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2026 17:35:34.2087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tWgs7gd5b9ihqijeWz6ObS0nWX28eqpfVQ8nx+Pc0vY4qvylMLCe7YTAM6TZt/Vw6TXvCXMhrddL/2I5oj6izg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB5134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_093544_658704_F0FB925D 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Check run_delay against last_steal and skip the update if they match.
This avoids looking up the memslot, accessing the SBI STA shared
structure, and marking its page dirty on vCPU loads with no new steal
time to report.

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
Signed-off-by: Koichiro Den <den@valinux.co.jp>
---
Changes since v1:
  - Check run_delay before looking up the memslot. (Andrew)

v1: https://lore.kernel.org/r/20261118062242.2914385-3-den@valinux.co.jp/

 arch/riscv/kvm/vcpu_sbi_sta.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
index 68d54696dbae..ebdd1435abd4 100644
--- a/arch/riscv/kvm/vcpu_sbi_sta.c
+++ b/arch/riscv/kvm/vcpu_sbi_sta.c
@@ -30,11 +30,16 @@ void kvm_riscv_vcpu_record_steal_time(struct kvm_vcpu *vcpu)
 	struct sbi_sta_struct __user *st;
 	unsigned long hva;
 	bool updated = false;
+	u64 run_delay;
 	gfn_t gfn;
 
 	if (shmem == INVALID_GPA)
 		return;
 
+	run_delay = READ_ONCE(current->sched_info.run_delay);
+	if (run_delay == last_steal)
+		return;
+
 	/*
 	 * shmem is 64-byte aligned (see the enforcement in
 	 * kvm_sbi_sta_steal_time_set_shmem()) and the size of sbi_sta_struct
@@ -61,7 +66,7 @@ void kvm_riscv_vcpu_record_steal_time(struct kvm_vcpu *vcpu)
 		/* Publish the odd sequence before updating stolen time. */
 		smp_wmb();
 		unsafe_get_user(steal, &st->steal, finish_update);
-		vcpu->arch.sta.last_steal = READ_ONCE(current->sched_info.run_delay);
+		vcpu->arch.sta.last_steal = run_delay;
 		le64_add_cpu(&steal, vcpu->arch.sta.last_steal - last_steal);
 		unsafe_put_user(steal, &st->steal, finish_update);
 		wrote_steal = true;
-- 
2.54.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
