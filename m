Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A71C43602
	for <kvm-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 12:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HCL+raitqDHkqYxNNGTZKU9yyRwGjAW02kjbP6DEQyU=; b=0aWdJUmwEod3Rm
	/LHC9RwnWB2gOeRERuPV/oLbLMXsSxpGdsAHZkFn/ibG39xlm1sEnLnQw7Uv/Nd1c/bMYDDHjwa4u
	eRRf7qT88vMcR+gzJyXWb8lSIYcTHB62t5o4CvdNPKtuKeZfgweSLIScRANHS25d2jWxGDByslYpA
	eolqjdGh4/RXbYv7kMtee8+8RmI8lRobQliCzAESPklcHepLblfgdsXsvD9e6jscUBpKOi1JCUqb9
	wFbwmZbcIacdLotAN4wMNdEcWGnWMNdj5mTzzb54u5WwEehVlwADdrQUtItncLM+CoC89uX1uJ9PP
	DveGJbSZEQclTnPee+rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuRa-000000023fC-0xWl;
	Wed, 01 Jul 2026 12:53:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuRY-000000023e1-16bw
	for kvm-riscv@bombadil.infradead.org;
	Wed, 01 Jul 2026 12:53:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=72IaI52f8cz7AfdFatnymKM5hMQ+G/AeXiG0yhG7q8g=; b=ivMz+Tu9FeIwCG2+3eTjWD1hY4
	KYl9IeXSxl6tFK1GXDwcysyPaMDCCxLGEr0qyqcuFmGuKm0gIVU9kKJWiaD+dwy7R5E6QG4qt1A7U
	+ZjGBAtCauB8tUhT/s95V0OS4AjXKUDHUg30k/sh4TNS9IkbenvFgvQ5PHln/Fo8I4jVHDBDVomco
	UheNEzbh7/RwDhlRS1yO45SafEjTQz6DQ9MTeVFnKuG5Us7g7AUOYLq1TwAPuNjF/Ce/TMERYiMbR
	vTQ+aqfOh436s1BoEbvYApIR+OOboLSO3WUhHSsoFc92vHpMHiEJ6cwgMepNo7y8hTUCnSnR7GGs6
	Qe5etZXA==;
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weuRV-00000002mTi-07Hv
	for kvm-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 12:53:31 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so298149a12.2
        for <kvm-riscv@lists.infradead.org>; Wed, 01 Jul 2026 05:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782910407; x=1783515207; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=72IaI52f8cz7AfdFatnymKM5hMQ+G/AeXiG0yhG7q8g=;
        b=EVB4836a442YOaZpeeYAuQJeT8TeH/sqWdU8mFHjap+boEPRMnbcFL2nxL3OYZZuT3
         aZ4Q6IL+8hoeJvZasWjwXw8M8mlquklsz6oIGE3G5zu9si4AVI6LTHVoNnJiFAqWIgOL
         s5/eEb8h2K6uP8Zfxy5ZRVAodspuVZfu+7omnGmMmSVUZsN1hOO9q1MSx1VQFZui+TWH
         2xn5F/WwYKELDsyB9rHTL9qM62tB0abi5flcOOTjlu1146/CoRo2UGtkd8czb/Hd3Kl0
         M4I6D9YNJmiazv8K5ZIANcyx/RyMxZulqY3+GhQOPXcB/V+cDo1yCprKL0d3uiVvHPwj
         KsjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910407; x=1783515207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=72IaI52f8cz7AfdFatnymKM5hMQ+G/AeXiG0yhG7q8g=;
        b=BXrEw+niSchY5EtFtuQibC1jmM85jrSBuSXYZor9GYmM3J6xOWIJfxiJvoWtBgwSOe
         e4KJpxUoVDE7RgbJOoMvFKPjKFc/+tehV/1h+YZyHkTIWMITlMwMhSj5x/8Cu9hcyroC
         kWprZy3XSTP7oheDd24JTNLGN+zmJGumnZp3DnE38ccjssQMjo9duLtwjk2iLvHgI0kO
         bQTA/pfLIyEjUXdW0j0BXuoAZmXk4HZgcVIOF5BbDQAjyX6mdH4PmbfglieXpMi/Lz0v
         RR0r5qxSI3e44MzBQAnxnQRkkmMgpQ4Kl4U9tSP/yA9DukqJLIEHBppgzdJf605XlmA9
         XoXQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq0hsbCJMVQ6bVHiwo240VNpri2ggNijoMJZYftbLZZEdXIXhuU2KOOvdvjvlZEIVyFqPumiAatEzE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwHJwrf1pk+WDUfw1REnpgjImIKEODtltLIqR2fxILcEB+T51OI
	COJRn0Lwe511SH+tsk5xqas0eATZqtCxfcywrNG5PX37nGK6cmIV0Hhf
X-Gm-Gg: AfdE7clECqAALGKKmmdU+GQY8cqhNJ8AMyLndQG/tYNibzqfcjAp9dfkEWvKQjBGywp
	otyNbgz91JXTeMUCmHQuhUITAtD7eK9vTtqA0Dp/zq0PGiwjgJjxgR9iKrRSjj00rJkqWPTIu1+
	lYHQhhHcOFL9fj4PRIaF3Zjz/xh1SGeaEtfU8LiviUsao2LCIVvkMWrcjSIKJ20I5YNaBcqx6cd
	29i0rA9gPbbKPAvS+Jzery+LTKcrvc6PCRXfm1uGlcZj0G/7nEc/fDwk9ne9Tq9pJEy+9C/KFLs
	lzAp2nkxnHrkf1+gmY2VCRscHoX39P+8TWklMShLXL+xOhyuFDyUUFCzdPyfd/bHg8JvIWq+gO5
	hRUlrxJ/aNpDT3Bvj8XE9z1F6pKNghecIQCDR2HRoF9E7Q8BNFuz8/0Dvald2s6FNAJr11bBDXB
	GRklZ4XGwjJ5KpJ5/Xbh+EzioVIaX1Mw8=
X-Received: by 2002:a05:6a00:bd0b:b0:846:c7f4:74d with SMTP id d2e1a72fcca58-847c0a005a1mr1296978b3a.41.1782910406514;
        Wed, 01 Jul 2026 05:53:26 -0700 (PDT)
Received: from [127.0.1.1] ([120.244.9.45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03778basm3999403b3a.49.2026.07.01.05.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:53:26 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 01 Jul 2026 08:52:18 -0400
Subject: [PATCH v5 05/17] riscv: Add Zicclsm to cpufeature and hwprobe
MIME-Version: 1.0
Message-Id: <20260701-rva23u64-hwprobe-v2-v5-5-2c61f94a695a@gmail.com>
References: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
In-Reply-To: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Chen Wang <chen.wang@linux.dev>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Jesse Taube <jtaubepe@redhat.com>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, sophgo@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Guodong Xu <docular.xu@gmail.com>, 
 Jesse Taube <jesse@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, 
 Charlie Jenkins <charlie@rivosinc.com>, Andy Chiu <andybnac@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4429; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=T8J6F8JD2GSkUodQpbB8hIJ5DiwO5Q99BYhbCDqSwXw=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixX3pbPWgunsBici1WrecHyvMUv6sfKc1lTesrTuvt3O
 hlaWDF3lLIwiHExyIopshw+2pK99ZVPtO9zzh8wc1iZQIYwcHEKwEQs+RkZXmptcWKPj/oQnjfH
 8oWqw1+x8j9Td95eEL5Afv4n9cdynYwMj1csjFiw8ZrTkbg7rBfuvVjwJ56V75aQ6HFe7WkrRMs
 ecQIA
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_135329_166247_528601E6 
X-CRM114-Status: GOOD (  14.44  )
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

From: Jesse Taube <jesse@rivosinc.com>

Zicclsm requires misaligned support for all regular load and store
instructions, both scalar and vector, but not AMOs or other
specialized forms of memory access, to main memory regions with both
the cacheability and coherence PMAs, as defined in the profiles spec.
Even though mandated, misaligned loads and stores might execute
extremely slowly. Standard software distributions should assume their
existence only for correctness, not for performance.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>
Signed-off-by: Jesse Taube <jesse@rivosinc.com>
[Rebased, rewrote doc text, minor commit message revisions]
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v5: No change.
v4: No change.
v3:
- Move the hwprobe.rst entry to the IMA_EXT_1 section so its
  documentation matches the IMA_EXT_1 bit it was allocated in v2
  (Sashiko, agreed by Andrew).
v2:
- Rebased onto v7.1-rc2; moved ZICCLSM to IMA_EXT_1 and
  allocated a new bit for it
---
 Documentation/arch/riscv/hwprobe.rst  | 4 ++++
 arch/riscv/include/asm/hwcap.h        | 1 +
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/cpufeature.c        | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 1 +
 5 files changed, 8 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index d9928641deb99..49d9fb68632d0 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -401,3 +401,7 @@ The following keys are defined:
     as defined in version 1.0 of the RISC-V Control-flow Integrity (CFI)
     extensions specification, ratified in commit 302a2d45c243
     ("Update build-pdf.yml") of riscv-cfi.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICCLSM`: The Zicclsm extension is supported,
+    as defined in the RISC-V Profiles specification starting from commit
+    b1d80660 ("Updated to ratified state.")
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 44bf8c7d8acc5..e8f4a7dd96a93 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -112,6 +112,7 @@
 #define RISCV_ISA_EXT_ZCLSD		103
 #define RISCV_ISA_EXT_ZICFILP		104
 #define RISCV_ISA_EXT_ZICFISS		105
+#define RISCV_ISA_EXT_ZICCLSM		106
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 9139edba0aecb..6819df159c51e 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -116,6 +116,7 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE	15
 #define RISCV_HWPROBE_KEY_IMA_EXT_1		16
 #define		RISCV_HWPROBE_EXT_ZICFISS	(1ULL << 0)
+#define		RISCV_HWPROBE_EXT_ZICCLSM	(1ULL << 1)
 
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 686dde3ce3b98..1fb595581adcf 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -502,6 +502,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
+	__RISCV_ISA_EXT_DATA(zicclsm, RISCV_ISA_EXT_ZICCLSM),
 	__RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicfilp, RISCV_ISA_EXT_ZICFILP, riscv_xlinuxenvcfg_exts,
 					  riscv_cfilp_validate),
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index f8f68ba781b45..9cf62266f1890 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -205,6 +205,7 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
 		 * in the hart_isa bitmap, are made.
 		 */
 		EXT_KEY(isainfo->isa, ZICFISS, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZICCLSM, pair->value, missing);
 	}
 
 	/* Now turn off reporting features if any CPU is missing it. */

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
