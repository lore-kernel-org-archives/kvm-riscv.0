Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C15BC02180
	for <kvm-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 18:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uLZ/gyLcvStxh5w9z1hey5CU7NV57+NZatqH7QQFBFU=; b=emgE55BXQn+700
	+BRWSRm+JpKdLiEWBW71MtyVM4b1kjxfyLNA99SFtiFRcPOROL2TWtR5tvCxn+9TIMM+/IQT5HyCh
	5Ph3p0Fhb6zqJmVFF3bysF7IWlnbezfFsAd2H6zZBExKXW1OVTgoIhXd0PD4wGiADPhBzKhe7p/Rs
	xN6/4Lht+KfE1aFkt0NH64nA+u2l69vUQHaidHT5SnFWGBnERrkn8wAidFxT1ffCl9/XAmINbug6w
	26QK9OBLslebxtXR6igYHcWrsgJZc/BnE6jbgni+Vj31egk8Psp4NTdNlSA7wUGLr9FiGfLECR6ln
	BgupFiubhg2YMbMuBtkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8JC-0000000CnJE-3ICL;
	Wed, 15 Jan 2025 18:40:06 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8AS-0000000ClGB-0A32
	for kvm-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 18:31:05 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-21654fdd5daso122340955ad.1
        for <kvm-riscv@lists.infradead.org>; Wed, 15 Jan 2025 10:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736965863; x=1737570663; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YPQonIfRWz8q533cgyWsgSdgY3t/tGTd1rJqUG9L59Y=;
        b=Fsm/ZpOAS5KuspMftZT5V0A9ai3TZIsKl6kjutZ3y3JLZEilW+kAGCUWojzXvbr3It
         6KsGdSfWUJmTHfqm/yQi8Dn/GtzKOg0j6B4NNWmLCrDTp0b6j+OZrmw20Hhvqj0VLvUh
         0SflRrZTgQNb1JYngWYKhXMf9VVdZ+OLzDHLyUrYKv3hsaMw48iLFhuKpiQG68eat/Wd
         KLARQZyxgTD/ZXSBkKmScihH4kHD8cmka/DHa0B8ohl6WvBidfcFZL+eI4kB2gK0LyLk
         bW8LHq8BwONK0gW96OxKj6lEbgOuvlufpseS2Rchq9vWFpfTvhlGohX8nWTEKUidPmNg
         Briw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736965863; x=1737570663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YPQonIfRWz8q533cgyWsgSdgY3t/tGTd1rJqUG9L59Y=;
        b=hKL2AvmWMEOx1ei0pElQR355qLl62Jv6m7QxCmm5dmR93yFciOGHPM8F2DM16Us6r4
         TLdmUl5ynWP8VFzfehSxk7ltqRk2cBMuTSJGAUZdGYEmgdsaVNsjSba3kLd91sqLinmN
         B7EOZK5kq9edwgmLe/5Jq2vongJnTRmB4CD6tB6vqXdhfshXD8ZCkep9+8PAUAqOLXkC
         JGYOsQOmWFifSp4KnmU+FUEo5Wp/fWsI+Oqe8YJsahULNBY+3ISkCaGUeyiBpIlZ6rOJ
         gaznW7ngtEJs6dcOIpeT62mWNxKP23dZJ3xl+a2fxLnwOFr8WyyREh3Vu/icPYzMg5qo
         vYKw==
X-Forwarded-Encrypted: i=1; AJvYcCVci6+xBWClITrLrZHvZtaIvxNUBzawwnP5UI8ulpoBNJmaIttRtkqBrQXq9f47TKujiXLdv4XqzpE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzcxXtZ3HCAzmjzE1IuDAKINtEpiUxqKrG8DcSeSYm+dSrUJYto
	oRbsgUbhAW4Y35koHvxi6yFajcN9IsoHERk2jsnS+czblm/wCjIy+WrTotrkeJDYUJ+RokAM4F3
	x
X-Gm-Gg: ASbGnctyyg8AMo3FqbgM97iPims5r5iW3HBmpdA43QzXw8Uy5ifv8qw0+xaXc9tkUOP
	yRMeP10QE5kMtO5J5zKYyN7bxw/FdS6gJ3rJ6S84e3LWo1vnVmnMi/2+GcDVa1/TTzCFCZMNUQp
	SHybLg3JvbzSjhAgYeAgcF8A0LwibydxaC+1JknGVTRipPnsO8uYnapk7H8WFoWzfQD2mADcDGE
	tgVMayMcvbGAWYBXlcD25F5hnZhD1SAIP6ZmddrUq4B83+z4lMGzYXG3+LmsaXRuUwjlw==
X-Google-Smtp-Source: AGHT+IHrlKrKdeucl7zMxkF/5l3NHVR4wNF51oJC9P55Fo2f9FtCoIn3BV0XWsDAU93AJPqz/FttjQ==
X-Received: by 2002:a17:902:ebc4:b0:21b:d105:26b9 with SMTP id d9443c01a7336-21bd10529e9mr125689755ad.16.1736965863474;
        Wed, 15 Jan 2025 10:31:03 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f219f0dsm85333195ad.139.2025.01.15.10.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 10:31:03 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 15 Jan 2025 10:30:47 -0800
Subject: [PATCH v2 7/9] RISC-V: KVM: Use the new gpa range validate helper
 function
MIME-Version: 1.0
Message-Id: <20250115-pmu_event_info-v2-7-84815b70383b@rivosinc.com>
References: <20250115-pmu_event_info-v2-0-84815b70383b@rivosinc.com>
In-Reply-To: <20250115-pmu_event_info-v2-0-84815b70383b@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_103104_130121_D1AE8224 
X-CRM114-Status: GOOD (  11.63  )
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

Remove the duplicate code and use the new helper function to validate
the shared memory gpa address.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_pmu.c     | 5 +----
 arch/riscv/kvm/vcpu_sbi_sta.c | 6 ++----
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index efd66835c2b8..ca23427edfaa 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -409,8 +409,6 @@ int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long s
 	int snapshot_area_size = sizeof(struct riscv_pmu_snapshot_data);
 	int sbiret = 0;
 	gpa_t saddr;
-	unsigned long hva;
-	bool writable;
 
 	if (!kvpmu || flags) {
 		sbiret = SBI_ERR_INVALID_PARAM;
@@ -432,8 +430,7 @@ int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long s
 		goto out;
 	}
 
-	hva = kvm_vcpu_gfn_to_hva_prot(vcpu, saddr >> PAGE_SHIFT, &writable);
-	if (kvm_is_error_hva(hva) || !writable) {
+	if (kvm_vcpu_validate_gpa_range(vcpu, saddr, PAGE_SIZE, true)) {
 		sbiret = SBI_ERR_INVALID_ADDRESS;
 		goto out;
 	}
diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
index 5f35427114c1..67dfb613df6a 100644
--- a/arch/riscv/kvm/vcpu_sbi_sta.c
+++ b/arch/riscv/kvm/vcpu_sbi_sta.c
@@ -85,8 +85,6 @@ static int kvm_sbi_sta_steal_time_set_shmem(struct kvm_vcpu *vcpu)
 	unsigned long shmem_phys_hi = cp->a1;
 	u32 flags = cp->a2;
 	struct sbi_sta_struct zero_sta = {0};
-	unsigned long hva;
-	bool writable;
 	gpa_t shmem;
 	int ret;
 
@@ -111,8 +109,8 @@ static int kvm_sbi_sta_steal_time_set_shmem(struct kvm_vcpu *vcpu)
 			return SBI_ERR_INVALID_ADDRESS;
 	}
 
-	hva = kvm_vcpu_gfn_to_hva_prot(vcpu, shmem >> PAGE_SHIFT, &writable);
-	if (kvm_is_error_hva(hva) || !writable)
+	/* The spec requires the shmem to be 64-byte aligned. */
+	if (kvm_vcpu_validate_gpa_range(vcpu, shmem, 64, true))
 		return SBI_ERR_INVALID_ADDRESS;
 
 	ret = kvm_vcpu_write_guest(vcpu, shmem, &zero_sta, sizeof(zero_sta));

-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
