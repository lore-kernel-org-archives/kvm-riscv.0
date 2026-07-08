Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF285C44503
	for <kvm-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 03:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kEakCNwKyK7sP18zgsATcNXldXPqWyb0Rtk+gp55E6w=; b=YobW774DjsjHp7
	RplMx4fRO+rjzNwrHT79VF7ZRREckGKaM92Z5nFn+zreiYxBIorpBFjl9lkzBW9NJ1Po3LIq9Z4/a
	7bnvXrqZSxo1GQHQhnkwihrks3Zw+rmjbMcR77ExPAMBdOVhgHhH3ogBHoBOWHEvM77oHjgWCwh29
	DY3AVEesLuVo3enzpxTV76WqgZJ/qlvaXc+VSSwOYp4Ydy2a0ZZY//B2pZzy2xeidDWAZ7WnsvORP
	+IiIo2wIExqbt6Ab2QHVSE5Ci2iEjfMAk7fYNqe/ywf782iJl/FRCfnh+noo8Kl51FQcW61VE3cSy
	PHHBi/XpWpk70LytMz+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJ6C-0000000GGid-2jd4;
	Wed, 08 Jul 2026 03:37:24 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJ5a-0000000GFwp-2Oxu
	for kvm-riscv@lists.infradead.org;
	Wed, 08 Jul 2026 03:36:56 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-c99eaa1f020so170459a12.2
        for <kvm-riscv@lists.infradead.org>; Tue, 07 Jul 2026 20:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783481806; x=1784086606; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GJBmXlsdV1hfdU5uODx6ZlHlbgxAOvIQb43p46Hii1A=;
        b=MEukdrSlR/seJxDlyfRlfDF3V1CIvJRDmZJfCjtg+S16PlYf4+Ifetev/LEIeqcSo0
         yb2qNpdxxv9+J03KPPzHzX4vf54BL/qffHNSDPENQ4tu4nYwZj3lbuRvKzQp/4zZmbDa
         urgoi9CYZR7tdsCXmYJ9CjyL48JsWK8TjKoST2RjrTX03BsABoIZ4HRMCKUa9LNEIncH
         dzAiMOu5CTQpxlAF8inH2C/Ya9dvZlvXJk+sXlf+ifwgqMMXJ+/XgtGnJ6o1q40pCkix
         5+zV97FCexCfDgPVYSzsn7gA51TYLGjY7IwlGU28ksDDJfvRDUFUJiUu3/x//nBvxdGE
         U3WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783481806; x=1784086606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GJBmXlsdV1hfdU5uODx6ZlHlbgxAOvIQb43p46Hii1A=;
        b=Jn1IocAAZ2Cm0QjKNv5njGMSn70xroA7Hd+7BvqwSKj8p5GxBHdInTYMnGUWvFwsx0
         QKWvwFVNDAd2ZQNN1FjhP4vtBJ3WwqVQ6TAMIoxu/a0Gti+5dzbvUAuZSGfOAPhvelU9
         XK0tqqimkrlEY+fooXB2b3kdV2fIvw6Oyg8xnAW88mlK2apDm04flWAE3vQbMTqIAmx/
         SwKiTzWcJ/Y9Lf1C8ygMM6imtupA77yvdGJiNCMxh105/TugTCMPAcVVpdOX2QCbmKLf
         wiQAaZ7H3fRgLygs85eSE5Fa58tdv0/eJai/bhRi1zTCcHjkZQRTNMtjizdxSCNIiopN
         KuNw==
X-Forwarded-Encrypted: i=1; AHgh+RqETcfwxoICRg/0EnEnHYi4D+9zFgCBRSeFnJ0qAtR/l1DGr4MckHm1eVxcfasvWbU1gNoXBOx5+3o=@lists.infradead.org
X-Gm-Message-State: AOJu0YzRZ4hSuJdUJPyOjJq1SBvo/moVPGUj7uUzRLhHfNa6K8A/uYHC
	jIOEMUh5i5ng/Pn46RfYzeSvWAqhQdR+BHKwYhJjRPhGmfwh3nINutmU
X-Gm-Gg: AfdE7ckt7H9pxuvW+pez7xDjFfsH+FzEfuoZio/+knMXkl4l+Yxe0jJBdHwygm401gn
	0lXYF/i10w5AGfslAARhCdNsUpbZGb7fIP4tZgz53uwUMuCC6mLDD3aFSxt4L4oCsMBlhX4Uq1N
	XmuXBunNrw5eizZQSVIuiK7P1hHDAVInCu0rvnxjsU7YzdSkfQwnoD1TAR/Qix94KMUTwP8cCtU
	Qks/axFPGYKq3yhH7VqztPxeLN8iObIZQXhq7dQ9wUNltdoxfYfkcZC4TCtdGg12QmHbymj+OYD
	kvjwlTvwcyCgpfrapLu3aOpdyYx0eE6myrTstUHSpFS1pPZx6BJUAve/2R8xkFMdpXvpxNSLsd6
	V4I8KAWO8btrJtIJ7ws/SDKBN/TiwEWYNQxC8JssSigIsmNkkHLz2BYkggb9xN0RPcg2XDllvsh
	EQu3qQE/2s9mnt2n9rgjpM/nP6xdoWr76BiPgfrFU=
X-Received: by 2002:a05:6a21:400d:b0:3c0:9c1b:d0b5 with SMTP id adf61e73a8af0-3c0bd2ab6e9mr595240637.64.1783481805671;
        Tue, 07 Jul 2026 20:36:45 -0700 (PDT)
Received: from [10.0.0.65] ([2601:647:6700:64d0::94ac])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accae5sm21092850eec.29.2026.07.07.20.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 20:36:45 -0700 (PDT)
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Date: Tue, 07 Jul 2026 20:34:39 -0700
Subject: [PATCH v3 16/17] riscv: kexec: Use generated instruction headers
 for kexec relocations
MIME-Version: 1.0
Message-Id: <20260707-riscv_insn_table-v3-16-3f8e5f75ba97@gmail.com>
References: <20260707-riscv_insn_table-v3-0-3f8e5f75ba97@gmail.com>
In-Reply-To: <20260707-riscv_insn_table-v3-0-3f8e5f75ba97@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Nam Cao <namcao@linutronix.de>, Alexandre Ghiti <alex@ghiti.fr>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Conor Dooley <conor@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>, 
 Jesse Taube <jtaubepe@redhat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783481778; l=3956;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=34NvWLgWZxGAYVZyLbG0y/AhPlMD8oyGVqDaoGR9FaA=;
 b=HHAGABMOnP/KQwIk7NT3288oN7tkMvICA9VbvqP0An0Jr7dhNcfRSg/YZPfDaqToCGW60/N8b
 Vx8IQZDIJiIAoEmMNb7Y6NORWvzqH2Zg06kLdzkam58TbLZddvI5bvS
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_203648_298343_23989E8F 
X-CRM114-Status: GOOD (  11.77  )
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Migrate the kexec relocation code to use the generated instruction
headers instead of the hand-written instruction composition functions.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

---

This was again tested by brute forcing all possible inputs to the value
fed into the immediates.
---
 arch/riscv/kernel/machine_kexec_file.c | 55 ++++++++++++----------------------
 1 file changed, 19 insertions(+), 36 deletions(-)

diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index 54e2d9552e93..cad40e4afd86 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -116,32 +116,6 @@ static char *setup_kdump_cmdline(struct kimage *image, char *cmdline,
 	(((x) + (RISCV_IMM_REACH >> 1)) & ~(RISCV_IMM_REACH - 1))
 #define RISCV_CONST_LOW_PART(x) ((x) - RISCV_CONST_HIGH_PART(x))
 
-#define ENCODE_ITYPE_IMM(x) \
-	(RV_X(x, 0, 12) << 20)
-#define ENCODE_BTYPE_IMM(x) \
-	((RV_X(x, 1, 4) << 8) | (RV_X(x, 5, 6) << 25) | \
-	(RV_X(x, 11, 1) << 7) | (RV_X(x, 12, 1) << 31))
-#define ENCODE_UTYPE_IMM(x) \
-	(RV_X(x, 12, 20) << 12)
-#define ENCODE_JTYPE_IMM(x) \
-	((RV_X(x, 1, 10) << 21) | (RV_X(x, 11, 1) << 20) | \
-	(RV_X(x, 12, 8) << 12) | (RV_X(x, 20, 1) << 31))
-#define ENCODE_CBTYPE_IMM(x) \
-	((RV_X(x, 1, 2) << 3) | (RV_X(x, 3, 2) << 10) | (RV_X(x, 5, 1) << 2) | \
-	(RV_X(x, 6, 2) << 5) | (RV_X(x, 8, 1) << 12))
-#define ENCODE_CJTYPE_IMM(x) \
-	((RV_X(x, 1, 3) << 3) | (RV_X(x, 4, 1) << 11) | (RV_X(x, 5, 1) << 2) | \
-	(RV_X(x, 6, 1) << 7) | (RV_X(x, 7, 1) << 6) | (RV_X(x, 8, 2) << 9) | \
-	(RV_X(x, 10, 1) << 8) | (RV_X(x, 11, 1) << 12))
-#define ENCODE_UJTYPE_IMM(x) \
-	(ENCODE_UTYPE_IMM(RISCV_CONST_HIGH_PART(x)) | \
-	(ENCODE_ITYPE_IMM(RISCV_CONST_LOW_PART(x)) << 32))
-#define ENCODE_UITYPE_IMM(x) \
-	(ENCODE_UTYPE_IMM(x) | (ENCODE_ITYPE_IMM(x) << 32))
-
-#define CLEAN_IMM(type, x) \
-	((~ENCODE_##type##_IMM((uint64_t)(-1))) & (x))
-
 int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
 				     Elf_Shdr *section,
 				     const Elf_Shdr *relsec,
@@ -197,12 +171,14 @@ int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
 
 		switch (r_type) {
 		case R_RISCV_BRANCH:
-			*(u32 *)loc = CLEAN_IMM(BTYPE, *(u32 *)loc) |
-				 ENCODE_BTYPE_IMM(val - addr);
+			/*
+			 * For simplicity, use beq as represenative of all
+			 * branches (they all have the same imm encoding)
+			 */
+			riscv_insn_beq_insert_imm((u32 *)loc, val - addr);
 			break;
 		case R_RISCV_JAL:
-			*(u32 *)loc = CLEAN_IMM(JTYPE, *(u32 *)loc) |
-				 ENCODE_JTYPE_IMM(val - addr);
+			riscv_insn_jal_insert_imm((u32 *)loc, val  - addr);
 			break;
 		/*
 		 * With no R_RISCV_PCREL_LO12_S, R_RISCV_PCREL_LO12_I
@@ -213,16 +189,23 @@ int arch_kexec_apply_relocations_add(struct purgatory_info *pi,
 		case R_RISCV_PCREL_HI20:
 		case R_RISCV_CALL_PLT:
 		case R_RISCV_CALL:
-			*(u64 *)loc = CLEAN_IMM(UITYPE, *(u64 *)loc) |
-				 ENCODE_UJTYPE_IMM(val - addr);
+			riscv_insn_auipc_insert_imm((u32 *)loc, RISCV_CONST_HIGH_PART(val - addr));
+			riscv_insn_jalr_insert_imm((u32 *)loc + 1,
+						   RISCV_CONST_LOW_PART(val - addr));
 			break;
 		case R_RISCV_RVC_BRANCH:
-			*(u32 *)loc = CLEAN_IMM(CBTYPE, *(u32 *)loc) |
-				 ENCODE_CBTYPE_IMM(val - addr);
+			/*
+			 * For simplicity, use c.beqz as represenative of all
+			 * compressed branches (they all have the same imm encoding)
+			 */
+			riscv_insn_c_beqz_insert_imm((u16 *)loc, val - addr);
 			break;
 		case R_RISCV_RVC_JUMP:
-			*(u32 *)loc = CLEAN_IMM(CJTYPE, *(u32 *)loc) |
-				 ENCODE_CJTYPE_IMM(val - addr);
+			/*
+			 * For simplicity, use c.j as represenative of all
+			 * compressed jumps (they all have the same imm encoding)
+			 */
+			riscv_insn_c_j_insert_imm((u16 *)loc, val - addr);
 			break;
 		case R_RISCV_ADD16:
 			*(u16 *)loc += val;

-- 
2.54.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
