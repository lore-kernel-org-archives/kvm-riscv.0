Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8008CC43327
	for <kvm-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 12:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i3IpDpxghblHtOs0Sz4Jl7XBufq18MgA4jePmx0icos=; b=sCNjnhsH5oiOnt
	LF/vdFm7zSQe9bf+LzHz2VtZYLyh+TwWN7cQ7y9pYDiCPozpk2ZN3W3daN1eCBYyEBU/3SGQywJmY
	OilgQ3R2no38BS9Jj1+QXIU0bPvKyve13+M2RqNLt30Gh3lCN36RHR9kcXkhV4/ehEw8GI9BS77bU
	GO58JlAIj9U7Q1aeM9PslPqBadDFROHh92jt5TpobOUlwmLRm+DBypK7gsCLRPmD4yh1GAay9JZlg
	3h7ctXd7BqzXGJYf6vaL1ezYRZmAo+3UxFxBc2U3Kb2dDx2ca/BA2zgbYWdWfNVF0mwZtgFQnyfpp
	fcllg1/QRgnaotzOYV+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuSP-00000002483-0ZKF;
	Wed, 01 Jul 2026 12:54:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuSN-00000002478-2ZlF
	for kvm-riscv@bombadil.infradead.org;
	Wed, 01 Jul 2026 12:54:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=8K/a6AEhCKKl6b6WVU/a0dv3ErkxxiYJVhxQewlVnUE=; b=QdBMmc6DkBCyfWUQ+Yzr7MneTR
	h6SWjrsyBvhpDqjkx4v3U4vboQSTQdkxJaV4r0B6pfPp6wIJnHs2oSfWeYL1oJm6TkddFEUliG1B3
	iBk/iR50GrhHT+eANsh61+0kpqa9M8sgrfezVJUmywX0awXIqIduK0T5v7jQ8NWcSeejNxqx6grDL
	rYORkFEVGkvGz/amSaNt/2CfZJnDs+6zp5tzMTyW8xYp/BpQeb91ogoW2y9oY6ffImn7CmwYOfD9Q
	BoX+kRqxyEj3dKNo0GVo/Aa1JXFvk4EQBES1Gu84ZFrG7MgdJx2+ZeorUZI3s0HUNkew7sldby4JT
	Ya9k1edA==;
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weuSJ-00000002mds-2g3D
	for kvm-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 12:54:21 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-847968ca62fso482702b3a.2
        for <kvm-riscv@lists.infradead.org>; Wed, 01 Jul 2026 05:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782910458; x=1783515258; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8K/a6AEhCKKl6b6WVU/a0dv3ErkxxiYJVhxQewlVnUE=;
        b=BkZug/HmpxNHpdk3Hb0/2VSayYOERrpLpWgD/qQwL/w+wlOipSrCEGbLvTDvktRu0b
         /iDjDhe8HdDAYacimjgmkmk0NsdTFnf9Dte6koFdkIEOMCwcz9mWRB3A22rj9XmaZjnY
         C6LZOwYzLcQS5IBf0JjBfnVLqokRXkGR6R2EoVi+O1rqu4A2q0RPgUtC19fYnhPKWO8J
         aP3+1kHtQxxvymkzWACCXRaLJj0D7X5vamWh6t+HzTs0wbsWIMl+gFvgksY6UtpB+oOh
         /4IIVeKWQJDgwtBeKVJh/JS0MAqMz9hgWgwJfBfJYpgTQckrKJJtdC+grC7ZHoSl1NWf
         CA0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910458; x=1783515258;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8K/a6AEhCKKl6b6WVU/a0dv3ErkxxiYJVhxQewlVnUE=;
        b=N3QH5/C3PBWFDS2NWGf6oDQ1nI3y8s8o31yZQ76/YYdxLohcre5g/wpxGMRtILGqHy
         SHF3/J0nBTx0CTmP2/H7gz1p1e4FZzt1eAPIThtLGtfPJg0H8eQTwARA5uly4zs2exoW
         6redQjnXPzjSPL2VG6BzkEX2nX6lFtmg9UfPutNi2fPEoa3UtA0Hezuyo+Hc1Ht7/dFH
         RfoSmnHx1HENEpkukxLommNI8NgbpRMewOFU3+H/zE2xUZ4rRTxGw+I/H24gpdlhdqrK
         6jWCwLcc4BJEdHcWD5yIM/zGas2gq3VGTD0m4crFsOUvabfbNxCBHlp5amMJPK3RU2Ww
         QbEw==
X-Forwarded-Encrypted: i=1; AFNElJ9du91RA68ZPu0Q3nQm2ijVG9m0/WHvN20tPcbWcCkFRXR5II/zf9QOcQrntYloQy1RST9kJweuXF4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxKwXpWtfySAqiQLLpkGIg525qIV2d6nuqWJDUR23tcZ/uQuzYf
	BgFdssq8JumsIMHK2k/i5nKg1RorhH9F9fuHirZQWrUDUxhML0I6i0/D
X-Gm-Gg: AfdE7cn0dMTsj9/Eg4tsVKCd7T42FjNzqcZoUoLhzWFr7LiXOOvY5+KuyBHpuceOZyP
	xvQRJ9TZ8mjhqlAXWgBZ07Mow6JkD0MhdRzKn35wlMrPh5tq9kPSy+pnTrdVmGcWTLUnIYz4HDJ
	ted53m/xd31Jk/TD/Rh+2RQEjTL/hMETFs5ZLfMJIV6gD5Du/GDD4Wquh22UcKmdLONxG7Gt87a
	MZ4u1FK0vN9Hsmfw9WyJOcHpLdkgMk9SmidVNQZjqT6o4g7Wan4R4xH2d0kGCaXpnMBVITdytVP
	8PWwVJaNPTdWocAx2iqxl3cJdr+Fi01mc+vBUFqyXgaEPcZg/p1GZlG+XO/fyxBAIkNj4EINcwT
	isAnvJkYq0RSazskzzQ3yzWoD0v/wPgwNTUwrvsGJQCHj+S9hIRcsrbqcORogMBidgAG3a+eRVx
	13EinOzjAK1+/5XUMt/8AK
X-Received: by 2002:a05:6a00:27ac:b0:847:99b4:d005 with SMTP id d2e1a72fcca58-847c097d0bdmr1329287b3a.61.1782910457611;
        Wed, 01 Jul 2026 05:54:17 -0700 (PDT)
Received: from [127.0.1.1] ([120.244.9.45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03778basm3999403b3a.49.2026.07.01.05.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:54:17 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 01 Jul 2026 08:52:23 -0400
Subject: [PATCH v5 10/17] riscv: Add Zic64b to cpufeature and hwprobe
MIME-Version: 1.0
Message-Id: <20260701-rva23u64-hwprobe-v2-v5-10-2c61f94a695a@gmail.com>
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
 Qingwei Hu <qingwei.hu@bytedance.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5679; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=v3bkflKvhJMLJLs8CMo44CCLgRBUGW+Y8dK7sdakiYs=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixX3tazczNXzLhx5cH0q81iznKfxGu/tW0t8p6zlUOwv
 dw+dkF1RykLgxgXg6yYIsvhoy3ZW1/5RPs+5/wBM4eVCWQIAxenAEwkV5iR4ci3HSE7VJ8F1Efe
 bXjOnabyreTLwwt7b655ZlGtNKm5HqjiwzttdxH9y3MqV0nEMPKERs4+p1MXPcOKKSz56MzUxA/
 MAA==
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_135419_809635_57BAF909 
X-CRM114-Status: GOOD (  18.14  )
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

From: Qingwei Hu <qingwei.hu@bytedance.com>

Zic64b mandates 64-byte naturally aligned cache blocks and is a
mandatory extension of the RVA22 and RVA23 profiles.  Allocate a
RISCV_ISA_EXT_ZIC64B id, parse "zic64b" from the ISA string with a
validate callback that requires each cbom/cbop/cboz cache block size to
be 64 bytes when it is present, and export it through hwprobe.

Link: https://lists.riscv.org/g/tech-unprivileged/topic/question_about_zic64b_and/119631059
Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
Co-developed-by: Guodong Xu <docular.xu@gmail.com>
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v5:
- Collected Reviewed-by from Andrew Jones and Conor Dooley.
v4:
- Credit Qingwei Hu's earlier Zic64b cpufeature patch: set him as
  author, with Co-developed-by (Guodong Xu).
- Validate only the cbom/cbop/cboz block sizes that are present; Zic64b
  does not imply the CMO extensions (Conor, Qingwei, Greg).
- Add a Link: to Greg's confirmation on the tech-unprivileged list.
- Add the missing blank line before the ZIC64B hwprobe.rst entry
  (Andrew).
- Did not carry Andrew Jones's v3 Reviewed-by: the validation was
  rewritten (present block sizes only) and the patch is now authored by
  Qingwei, so it warrants a fresh review.
v3: New patch.
---
 Documentation/arch/riscv/hwprobe.rst  |  4 ++++
 arch/riscv/include/asm/hwcap.h        |  1 +
 arch/riscv/include/uapi/asm/hwprobe.h |  1 +
 arch/riscv/kernel/cpufeature.c        | 19 +++++++++++++++++++
 arch/riscv/kernel/sys_hwprobe.c       |  1 +
 5 files changed, 26 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index fc68dea397aae..32a14331eb9de 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -425,3 +425,7 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_B`: The B extension is supported, as defined
     in version 1.0 of the Bit-Manipulation ISA extensions, and implies the
     presence of the Zba, Zbb, and Zbs sub-extensions.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZIC64B`: The Zic64b extension is supported,
+    as defined in the RISC-V Profiles specification starting from commit
+    b1d80660 ("Updated to ratified state.")
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 58523b3a1998a..36572c1ff438a 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -117,6 +117,7 @@
 #define RISCV_ISA_EXT_ZICCAMOA		107
 #define RISCV_ISA_EXT_ZICCIF		108
 #define RISCV_ISA_EXT_ZA64RS		109
+#define RISCV_ISA_EXT_ZIC64B		110
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 430dc49a82863..36ec8ab470423 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -122,6 +122,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZICCRSE	(1ULL << 4)
 #define		RISCV_HWPROBE_EXT_ZA64RS	(1ULL << 5)
 #define		RISCV_HWPROBE_EXT_B		(1ULL << 6)
+#define		RISCV_HWPROBE_EXT_ZIC64B	(1ULL << 7)
 
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 9eee53b264de1..4c3bf813af052 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -136,6 +136,24 @@ static int riscv_ext_zicbop_validate(const struct riscv_isa_ext_data *data,
 	return 0;
 }
 
+static int riscv_ext_zic64b_validate(const struct riscv_isa_ext_data *data,
+				     const unsigned long *isa_bitmap)
+{
+	/*
+	 * Zic64b mandates 64-byte naturally aligned cache blocks; cross-check the
+	 * cbom/cbop/cboz block-size (when declared) device-tree properties to
+	 * avoid inconsistency.
+	 */
+	if ((riscv_cbom_block_size && riscv_cbom_block_size != 64) ||
+	    (riscv_cbop_block_size && riscv_cbop_block_size != 64) ||
+	    (riscv_cboz_block_size && riscv_cboz_block_size != 64)) {
+		pr_err("Zic64b detected in ISA string, disabling as a CBO block size is not 64 bytes\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int riscv_ext_f_validate(const struct riscv_isa_ext_data *data,
 				const unsigned long *isa_bitmap)
 {
@@ -506,6 +524,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET(b, RISCV_ISA_EXT_B, riscv_b_exts),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_V, riscv_v_exts, riscv_ext_vector_float_validate),
 	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_H),
+	__RISCV_ISA_EXT_DATA_VALIDATE(zic64b, RISCV_ISA_EXT_ZIC64B, riscv_ext_zic64b_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index dcc102bf8f183..3e80e5551ae0d 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -211,6 +211,7 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
 		EXT_KEY(isainfo->isa, ZICCRSE, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZA64RS, pair->value, missing);
 		EXT_KEY(isainfo->isa, B, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZIC64B, pair->value, missing);
 	}
 
 	/* Now turn off reporting features if any CPU is missing it. */

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
