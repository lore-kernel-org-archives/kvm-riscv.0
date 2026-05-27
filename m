Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE39ACD5BDE
	for <kvm-riscv@archiver.kernel.org>; Wed, 27 May 2026 05:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kYHW3rzK8uTbQ0hgCQvchcQ7emZMMVmY9edojywhKyA=; b=305huFs39hA8Jh
	IDCUEYZOmN4bG4UT2e74tsKr5JWELItsb8vwZl6NNUAO2HynhCLKWv3FDu6YMOP+npKPzPq9+2WR5
	4uK1XKpkUldvNl8rju7V8ImQtBA0/EvnmZin1X4IbKkBghSGKO3VScyUmI3oM1leVt8du9d5Lyv/l
	oLKuCdAFUUAAaiJg9cD/c6UGu6n5hbV1I7QkqnhUF4kM7pUx96ecSo471g1SFS4HwtuzGyyXriIM8
	yb0IlAtzPuF5uRFmlF3hASH25zA+kCOPEmFCcA5erSSdVNhn7BRXxS5ae7zXIBR1IG+IaYX4hY8xa
	F+ruUDwOepbaZRjaNGKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS7CU-00000003Mlj-21CN;
	Wed, 27 May 2026 05:53:06 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS7CQ-00000003Mit-3yKC
	for kvm-riscv@lists.infradead.org;
	Wed, 27 May 2026 05:53:05 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-3045c195251so4690188eec.1
        for <kvm-riscv@lists.infradead.org>; Tue, 26 May 2026 22:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1779861182; x=1780465982; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aUn9PyzRfhMmuzwTZR0m7Cfkjy913gm4r/60L8bBEqo=;
        b=AHnjORfpLL914qgJKldxSEICTUSx5qONMHn8pH/bGV7VXOvImMfMl+YxwGUH92yWgl
         Uf+mn45AMpMZw5WxazmQdRqPXTJlw3WdW228tBNd4+F+zcYjx161I+lbouNjVqRhiIMv
         ZTS9GttJ6/LkBSM+SMAe5/jiKJEI7xDBNzrBF/j5+n1QmTRkvgzCb64j6uoT7ZAnCTsa
         I1hBEr42MAKJDelvTk5FYulaSGyOKJCSn0as39npVYq9Lz0IwnitVspYIeSN88Mw5/rW
         /HUS+dNNJw3so4TEmYizwwHz9ocORaNCs7sBHyNyYHqigPcuBLUiA217aormJCCoCYNC
         j8iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779861182; x=1780465982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aUn9PyzRfhMmuzwTZR0m7Cfkjy913gm4r/60L8bBEqo=;
        b=XNdJWk1JmiCgZy2K+LNNS/1EdCCpIWP9UulgYZjyr4xmglr55/7eni8PQxjUkfrIxc
         OCXLXAMwHIkiMtwceQ8aReGo2D1mzLADLtO41Bn11wlFfCkwvIC9TrMueDfGTiL6Y+4g
         hEVjI+lilUQu8iRBO2uoaeBboz5gzEBkMEwSwaSWp7ZszPdS1pB7IMKZpMyOH36+6O1h
         xCjJwtl7reTQ+2Gg52jjDcfm4PPc5SNedXgxP8wp7W70DozFcRBebaDMQat6TofRKzxK
         5cg/++kzqTzG2g9FY+AQuXxDQH4kR28OBxsmH8aH3+1T/FMnU7ZUay1Cc+wd+UG8n1SI
         zh2g==
X-Forwarded-Encrypted: i=1; AFNElJ9krcudBhXnMJevHFLYe322wNhp4yKAZWfi9eu821ZTxha23HVruF6ZOBO+xMY3c5tzmuzx6WoX5yk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwOVSidP5JLLMdMhfp8VrGEvxVuuhcMciK0Q0YDDaZNsEzAGNY9
	aZMD4pEDpI0ygVo7TcdUXMi7N796ngUdSZT8bFRmW51h71y8ygQzbBi1QYqLHYkcMhg=
X-Gm-Gg: Acq92OHdLAtQCKxXjP9bNPpJ65dyxFUTEUq9fAVUz5RJqhqifCMbWuF27Iy/SZ4fHkk
	LzuITmuOQ3JBAyr+tQhL5UeqHbKtgH64fEd2VUn1eCQcXEGlEL8yEw6aA+cTAiZovBQ5jBvqhmb
	VWqEWO6B8I/dNVcpFaa1wlgHPh4p3Qm39RIbgO8LXDvKVbNTF2cjj31+Vdlu0WbkCQLslOiq0h6
	3BXkJ1d5o4JZ9IW6RCZd2V+5rvs1HpWYmzh6eDICL15P26Vr0Mqs9J5OOXQJJUj1M6Oyu5BdPcg
	FSnAMSPy0MsgoSBRZHjv8YgkA5opBcJ6vLW/ehMUO/mmZgUajud//zXMOrfnaGrFhGcpFsXONyz
	jzmnI8vFRykq9uImtMNkWefgcRAXjkPbnWkVRwy91z79UsHvg6H8+V7FT1j8dbZPVLvIET7D5DX
	vCksr69MQ8eiDgsgnxHCO5xdsp5B/D0GfdUv9AHAmQZ0o=
X-Received: by 2002:a05:693c:69ce:b0:304:6782:d596 with SMTP id 5a478bee46e88-3046782e6eamr3796621eec.4.1779861181594;
        Tue, 26 May 2026 22:53:01 -0700 (PDT)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304be0851c9sm613202eec.23.2026.05.26.22.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 22:53:00 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Tue, 26 May 2026 22:52:38 -0700
Subject: [PATCH v2 1/3] KVM: RISC-V: SBI FWFT: Fix stale feature exposure
 after runtime extension changes
MIME-Version: 1.0
Message-Id: <20260526-kvm-get_reg_list-v2-v2-1-7940a401454a@sifive.com>
References: <20260526-kvm-get_reg_list-v2-v2-0-7940a401454a@sifive.com>
In-Reply-To: <20260526-kvm-get_reg_list-v2-v2-0-7940a401454a@sifive.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779861178; l=4044;
 i=yongxuan.wang@sifive.com; s=20260424; h=from:subject:message-id;
 bh=8rCDNvc2TJDmq0o9jKD+SWttG8Vm4gJbAUgSdeBhahw=;
 b=AfhaUDr6EDvzRR8AckzFU4mLJnayFuZt//mAddpv5TFe16Wy03F28lBbX2zJK5NPIj/ZCUBLU
 sDKiVJUb++NDY3CurknxqrlxIaH+V8PPFsplhKxsEtPX1j0d3+NfVcx
X-Developer-Key: i=yongxuan.wang@sifive.com; a=ed25519;
 pk=+8NCHB1ZJvZthQAmZspOAaqjo+/snaW8mFSiDx45HxY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_225302_999488_5AA799FD 
X-CRM114-Status: GOOD (  15.50  )
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
However, when userspace subsequently disables ISA extensions  via the
KVM ONE_REG interface, the 'supported' field was not updated. This caused
the following issues:

1. FWFT features would remain visible and accessible to guests even
   after their prerequisite ISA extensions were disabled
2. Guests could configure FWFT features that depend on disabled
   extensions, leading to undefined behavior
3. The static 'supported' flag and the dynamic supported() callback
   could disagree about feature availability

Remove the redundant static 'supported' field from kvm_sbi_fwft_config
and replace all conf->supported checks with feature->supported(vcpu)
calls that check the current vCPU ISA extension state. This can ensure
the feature availability is always determined at runtime based on the
current configuration, not initialization-time snapshots.

Fixes: 6b72fd170592 ("RISC-V: KVM: add support for FWFT SBI extension")

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h |  1 -
 arch/riscv/kvm/vcpu_sbi_fwft.c             | 17 ++++++++---------
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h b/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h
index 5604cec79902..837431867c6f 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h
@@ -15,7 +15,6 @@ struct kvm_sbi_fwft_feature;
 
 struct kvm_sbi_fwft_config {
 	const struct kvm_sbi_fwft_feature *feature;
-	bool supported;
 	bool enabled;
 	unsigned long flags;
 };
diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
index 2eab15339694..d3be059c3822 100644
--- a/arch/riscv/kvm/vcpu_sbi_fwft.c
+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
@@ -279,8 +279,8 @@ static int kvm_fwft_get_feature(struct kvm_vcpu *vcpu, u32 feature,
 		return SBI_ERR_DENIED;
 	}
 
-	if (!tconf->supported || !tconf->enabled)
-		return SBI_ERR_NOT_SUPPORTED;
+	if (!tconf->feature->supported(vcpu))
+		return  SBI_ERR_NOT_SUPPORTED;
 
 	*conf = tconf;
 
@@ -361,11 +361,10 @@ static int kvm_sbi_ext_fwft_init(struct kvm_vcpu *vcpu)
 		feature = &features[i];
 		conf = &fwft->configs[i];
 		if (feature->supported)
-			conf->supported = feature->supported(vcpu);
+			conf->enabled = feature->supported(vcpu);
 		else
-			conf->supported = true;
+			conf->enabled = true;
 
-		conf->enabled = conf->supported;
 		conf->feature = feature;
 	}
 
@@ -406,7 +405,7 @@ static unsigned long kvm_sbi_ext_fwft_get_reg_count(struct kvm_vcpu *vcpu)
 			continue;
 
 		conf = kvm_sbi_fwft_get_config(vcpu, feature->id);
-		if (!conf || !conf->supported)
+		if (!conf || !feature->supported(vcpu))
 			continue;
 
 		ret++;
@@ -428,7 +427,7 @@ static int kvm_sbi_ext_fwft_get_reg_id(struct kvm_vcpu *vcpu, int index, u64 *re
 			continue;
 
 		conf = kvm_sbi_fwft_get_config(vcpu, feature->id);
-		if (!conf || !conf->supported)
+		if (!conf || !feature->supported(vcpu))
 			continue;
 
 		if (index == idx) {
@@ -463,7 +462,7 @@ static int kvm_sbi_ext_fwft_get_reg(struct kvm_vcpu *vcpu, unsigned long reg_num
 		return -ENOENT;
 
 	conf = kvm_sbi_fwft_get_config(vcpu, feature->id);
-	if (!conf || !conf->supported)
+	if (!conf || !feature->supported(vcpu))
 		return -ENOENT;
 
 	switch (reg_num - feature->first_reg_num) {
@@ -500,7 +499,7 @@ static int kvm_sbi_ext_fwft_set_reg(struct kvm_vcpu *vcpu, unsigned long reg_num
 		return -ENOENT;
 
 	conf = kvm_sbi_fwft_get_config(vcpu, feature->id);
-	if (!conf || !conf->supported)
+	if (!conf || !feature->supported(vcpu))
 		return -ENOENT;
 
 	switch (reg_num - feature->first_reg_num) {

-- 
2.43.7


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
