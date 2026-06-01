Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C28CD5BD1
	for <kvm-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 08:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=drzn9j0VWiADU2G3j8lu4G7GdJF6eK1OuSUqzrCBN90=; b=NFoWifiUUDJXam
	w5XllgkDvWPnm4DaTA/5mXbrJmfSTJ5B/7iO125a/RtlpL0YqVXwh64NErP/tzu1zzkmsKjTGyiMC
	BNreCxXoSdC77uQykl2ntrpB9N1MeQ2genV5VqxeEPQLbWXuJ9rDjd4PKuq8xQQiEN2DQHL8bunRM
	gxjAfDwKKZbpJLIePnEBSlkseLXz/uZOqBWiYhSDkB2pzxFG/d5JgkodKHAs1ypvZdB5F4p23MtD5
	H0vV2Y4bsmHK9vh/yHrAhygjpxkQ6eqEAqqVukgNny1TshlqHSk+wMACchbhMtFpd6w9ENiXi/IiL
	HVGFa/FXBIcORf7vw27g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyCS-0000000ANUr-2UIc;
	Mon, 01 Jun 2026 08:40:44 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyCO-0000000ANSC-1ptC
	for kvm-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 08:40:43 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-304f590dd91so2253587eec.0
        for <kvm-riscv@lists.infradead.org>; Mon, 01 Jun 2026 01:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1780303239; x=1780908039; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4lscgRQDRbt2yakLS5hYeNYWDRzaYuJMCuwhj5mWoTY=;
        b=G+Tg2dsxuX5yonaOORx+zrO3+gC6jZXDsSd7xJMYBXgJHppXZR9qCEnLpNoxetBk14
         zdqz3IRHf+ALtRPzxxFaxjhq4uCFEQASWKsn+/yU94CKDmCGKBMSFpH0VVBHYYOOI9yo
         BiOmh0Bgd71OSvyfQVazl8BWmR4p6ZxyprpQrDZCD8mZFGgPXMAfokPjC7knBpm7Fzj5
         KCa6FCIjKgPCUDFLPxauH7A7dNd9aMNO3ndYRWAYPd5d8Kr3uT/HAo2khYW9sQ75+JVw
         hs5WKx4rKDZl74mBEtmXy6qTAwSlKWtQJDnIsvjj3bqVHE4SQRo0gfsJTVniNAXKpXUr
         89Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303239; x=1780908039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4lscgRQDRbt2yakLS5hYeNYWDRzaYuJMCuwhj5mWoTY=;
        b=MuwcrY9MToW1Snm9bcsFqbxlNmAkNL4aYByk/Xv9XThgDMm5T2ViQe1z+25ebzBPKt
         Sepo02rk0DLZbGh3geqdgaPjxldG1tz5VYUd/12U1j9CwVlZiRHotH12rBGuTK9WjWYw
         k1gbnu+GZlgCPiNYobU1LOuW9SDj00/nZ/dFOjoCmsmPAFuNzz2caZEJmyyjAxv/0Lyh
         Q09FI5FqcSGpYp5DvKDS+aY3FCpZ2opLL6ZxuYwaT26mcHHLZ5HDFDeKoMLxfWioc8/I
         q3TNX+Zz163nm1UynuqOHjlodSKyBEs9B0IVb/N/GhcyiDc6Hnprh8nAI+KtkTihXtU6
         1LIw==
X-Forwarded-Encrypted: i=1; AFNElJ8qmyxtbp7Lbob09crLJwNR7AnhTAzNhrn22AdBJfRtvNvTIo4/kw1b6TuN3urnT51Z/HlZH66nT4Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YxVXhJY2TSzjqlQKBm5KefGdUpj2loZzvmHoNpa6iwIxZIah88s
	TxemSFS7hFEAR9/gv6gba+/tidDA9AjrtMGLIW6LtefKOhgvyIC7QMT+XAOZ+vXhp/da3i7Vnjq
	vRnPTPiI=
X-Gm-Gg: Acq92OEog4AT09IKNQIh8otzYGeqMuZprcpZeYwPDnGMLbHqEdU315Q3+xDo9TYQe/2
	8ricMwKfXsDq/JQaxTbeXWHklUvWAZzTQV3kV+fcUWPUOlnjPT+aD1fjdidSJ0swaQTnOQD7eYV
	fLTo81VhCPDEgyqkNttcUAYFoVO0V6Sjrhnih6aVo61vKzuR2uWvZPYX96lJb/t1tloQu7iQo0I
	g3+fm0ocwhjXB1P3GY4HKkJZwX/gV5gJlPK+F5l4gCWh6KsP202xc0RS/yni5I7dthammr/XTv6
	5bYHeMbt+XcoJ1mkyFENVh3HFw7fSykrQbnN+KXMq9L3IJdNzEFLZ8e1Yc7PvbnHpgD25DyT9XX
	4XLN14MSF4EV+4wg2w2DnTxCdYirSxAOgJPw/S7uFuv+FT1PHcO5tYPnMN6RLrjDsadjK/ylNU7
	DfC/GWknVfn5NESbi2xpo0qI7wmHAyB7+P+5t44wmAlOSZiBm2VWFrXQ==
X-Received: by 2002:a05:7300:6c84:b0:2d9:6373:ad24 with SMTP id 5a478bee46e88-304fa67bcafmr4151923eec.26.1780303239441;
        Mon, 01 Jun 2026 01:40:39 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed5b9be7sm8011818eec.27.2026.06.01.01.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:40:38 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Mon, 01 Jun 2026 01:40:34 -0700
Subject: [PATCH v4 1/3] KVM: RISC-V: SBI FWFT: Fix stale feature exposure
 after runtime extension changes
MIME-Version: 1.0
Message-Id: <20260601-kvm-get_reg_list-v2-v4-1-c88abc81ebda@sifive.com>
References: <20260601-kvm-get_reg_list-v2-v4-0-c88abc81ebda@sifive.com>
In-Reply-To: <20260601-kvm-get_reg_list-v2-v4-0-c88abc81ebda@sifive.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Andrew Jones <ajones@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: greentime.hu@sifive.com, vincent.chen@sifive.com, zong.li@sifive.com, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780303237; l=5776;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=v8xk3QHpXNBkj9I0DJjJ1PRYb/tbiijkclCWUxXXvfY=;
 b=1EORkE6aAPHvwki+++Fi5anJeWWxlG6JgO9U5hx75Vmk/RBJMBCu3oiM1KmnU2PCa3r+OevoK
 x5Y9n8XWskBCXYDCfn/p/NOQSYH6gvcbzqdVTD59VfTevV2mR0+gJAZ
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_014040_473362_BC88E951 
X-CRM114-Status: GOOD (  16.85  )
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

Fix a bug where FWFT features could be incorrectly exposed to guests
after userspace disables their dependent ISA extensions at runtime.

The 'supported' field in kvm_sbi_fwft_config was set once during vCPU
initialization based on the initial hardware/extension availability.
However, when userspace subsequently disables ISA extensions via the KVM
ONE_REG interface, the 'supported' field was not updated. This caused
the following issues:
1. FWFT features would remain visible and accessible to guests even
   after their prerequisite ISA extensions were disabled
2. Guests could configure FWFT features that depend on disabled
   extensions, leading to undefined behavior
3. The static 'supported' flag and the dynamic supported() callback
   could disagree about feature availability

The fix introduces a two-layer checking mechanism:
1. Add an optional init() callback to the kvm_sbi_fwft_feature structure
   for features that require hardware probing during initialization. This
   separates the one-time hardware detection logic from the runtime
   availability check.
2. Add runtime checks in all FWFT-related functions that call
   feature->supported(vcpu) if the callback exists. This ensures feature
   availability is re-evaluated based on the current ISA extension state.

This approach maintains the cached 'supported' field for initialization-
time decisions while ensuring runtime availability is always determined
by the current vCPU configuration, not initialization-time snapshots.

Fixes: 6b72fd170592 ("RISC-V: KVM: add support for FWFT SBI extension")

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 arch/riscv/kvm/vcpu_sbi_fwft.c | 34 +++++++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
index 2eab15339694..2ad269a21021 100644
--- a/arch/riscv/kvm/vcpu_sbi_fwft.c
+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
@@ -35,6 +35,16 @@ struct kvm_sbi_fwft_feature {
 	 */
 	bool (*supported)(struct kvm_vcpu *vcpu);
 
+	/**
+	 * @init: Probe and initialize the feature on the vcpu
+	 *
+	 * This callback is optional. If provided, it will be called during
+	 * vcpu initialization to probe the feature availability and perform
+	 * any necessary initialization. Returns true if the feature is supported
+	 * and initialized successfully, false otherwise.
+	 */
+	bool (*init)(struct kvm_vcpu *vcpu);
+
 	/**
 	 * @reset: Reset the feature value irrespective whether feature is supported or not
 	 *
@@ -137,13 +147,17 @@ static bool try_to_set_pmm(unsigned long value)
 
 static bool kvm_sbi_fwft_pointer_masking_pmlen_supported(struct kvm_vcpu *vcpu)
 {
-	struct kvm_sbi_fwft *fwft = vcpu_to_fwft(vcpu);
+	return riscv_isa_extension_available(vcpu->arch.isa, SMNPM);
+}
 
-	if (!riscv_isa_extension_available(vcpu->arch.isa, SMNPM))
-		return false;
+static bool kvm_sbi_fwft_pointer_masking_pmlen_init(struct kvm_vcpu *vcpu)
+{
+	struct kvm_sbi_fwft *fwft = vcpu_to_fwft(vcpu);
 
+	preempt_disable();
 	fwft->have_vs_pmlen_7 = try_to_set_pmm(ENVCFG_PMM_PMLEN_7);
 	fwft->have_vs_pmlen_16 = try_to_set_pmm(ENVCFG_PMM_PMLEN_16);
+	preempt_enable();
 
 	return fwft->have_vs_pmlen_7 || fwft->have_vs_pmlen_16;
 }
@@ -231,6 +245,7 @@ static const struct kvm_sbi_fwft_feature features[] = {
 		.first_reg_num = offsetof(struct kvm_riscv_sbi_fwft, pointer_masking.enable) /
 				 sizeof(unsigned long),
 		.supported = kvm_sbi_fwft_pointer_masking_pmlen_supported,
+		.init = kvm_sbi_fwft_pointer_masking_pmlen_init,
 		.reset = kvm_sbi_fwft_reset_pointer_masking_pmlen,
 		.set = kvm_sbi_fwft_set_pointer_masking_pmlen,
 		.get = kvm_sbi_fwft_get_pointer_masking_pmlen,
@@ -281,6 +296,8 @@ static int kvm_fwft_get_feature(struct kvm_vcpu *vcpu, u32 feature,
 
 	if (!tconf->supported || !tconf->enabled)
 		return SBI_ERR_NOT_SUPPORTED;
+	else if (tconf->feature->supported && !tconf->feature->supported(vcpu))
+		return SBI_ERR_NOT_SUPPORTED;
 
 	*conf = tconf;
 
@@ -365,6 +382,9 @@ static int kvm_sbi_ext_fwft_init(struct kvm_vcpu *vcpu)
 		else
 			conf->supported = true;
 
+		if (conf->supported && feature->init)
+			conf->supported = feature->init(vcpu);
+
 		conf->enabled = conf->supported;
 		conf->feature = feature;
 	}
@@ -408,6 +428,8 @@ static unsigned long kvm_sbi_ext_fwft_get_reg_count(struct kvm_vcpu *vcpu)
 		conf = kvm_sbi_fwft_get_config(vcpu, feature->id);
 		if (!conf || !conf->supported)
 			continue;
+		else if (conf->feature->supported && !conf->feature->supported(vcpu))
+			continue;
 
 		ret++;
 	}
@@ -430,6 +452,8 @@ static int kvm_sbi_ext_fwft_get_reg_id(struct kvm_vcpu *vcpu, int index, u64 *re
 		conf = kvm_sbi_fwft_get_config(vcpu, feature->id);
 		if (!conf || !conf->supported)
 			continue;
+		else if (conf->feature->supported && !conf->feature->supported(vcpu))
+			continue;
 
 		if (index == idx) {
 			*reg_id = KVM_REG_RISCV |
@@ -465,6 +489,8 @@ static int kvm_sbi_ext_fwft_get_reg(struct kvm_vcpu *vcpu, unsigned long reg_num
 	conf = kvm_sbi_fwft_get_config(vcpu, feature->id);
 	if (!conf || !conf->supported)
 		return -ENOENT;
+	else if (conf->feature->supported && !conf->feature->supported(vcpu))
+		return -ENOENT;
 
 	switch (reg_num - feature->first_reg_num) {
 	case 0:
@@ -502,6 +528,8 @@ static int kvm_sbi_ext_fwft_set_reg(struct kvm_vcpu *vcpu, unsigned long reg_num
 	conf = kvm_sbi_fwft_get_config(vcpu, feature->id);
 	if (!conf || !conf->supported)
 		return -ENOENT;
+	else if (conf->feature->supported && !conf->feature->supported(vcpu))
+		return -ENOENT;
 
 	switch (reg_num - feature->first_reg_num) {
 	case 0:

-- 
2.43.7


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
