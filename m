Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE6BC54E90
	for <kvm-riscv@archiver.kernel.org>; Thu, 22 May 2025 19:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eGmdBM8iWVhvJYA4QH9r6NudHUhRRiktxpF04Jd4IL8=; b=vgYZEh6Od2YYiq
	I23n8WhS7HAAoj19cjjxsT5gKVl39zvUWG/iCbnj0wNJFaTQbhBqlfiHnHyy2fACVL+bShgN7fUXX
	5neN0bxARimOHHv/mea/XyuJqiw+ej/cFuyaXvNhQ/sO8sCYXONc+tC+TgFgKDe/JA+RBNOmlpsY1
	DFrvKhB7UEXdRvSH5PPXL2XLrnwY04VISkwpfsrKZ2pm2RYKFs0zhOqHQOXsXZ5gbm+oz1gR0YeRt
	KRv4pAYwZ56hm3nLAVdzGCkelq+G9XKCRg6zknsSrsZQjbyy2WeGZSk8oa94JwL+FzXOAaZBJz2Lg
	DsW+ZN5hET9gXpAVzRJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIBQw-000000020Fq-1pIx;
	Thu, 22 May 2025 19:18:26 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIBCr-00000001wT8-0Uiy
	for kvm-riscv@lists.infradead.org;
	Thu, 22 May 2025 19:03:55 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b26f67f10ddso4935228a12.3
        for <kvm-riscv@lists.infradead.org>; Thu, 22 May 2025 12:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747940632; x=1748545432; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hlpauo+rroktx9kyAnwP3yRkffTzlKUHEtIrSQJtdwQ=;
        b=xSsWGMPDBmBwo+KSj273kupPT46TUAvfSVJhR4m4PA47QIuHLzbdS6zDjwCU6TmE37
         +/GyvafhO8Xd5ZVvw0DJCUU05y1Qq77RbPCbKBpHVlcSkE/ot2/AzvWz3mOYkWxjMYL2
         zMtlYtsUOOC5RNJG/LJt3qeW+7iH6+cozBhBu/DDyXwVt1U5GgVHJVUhd0RQLs0Tn14U
         nnitmtCoAR9dL0S9dt+TbmopsDgmdvHjZej070wMEsNNIGwli9Ng1fp6OKi0MKHC8dQy
         gTd9uBytJuvzKHUsC1hpWG5He0mDTTrpZQA1exL06HfgfK2PaYKc1YADrglwoISNxaZh
         Nejw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940632; x=1748545432;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hlpauo+rroktx9kyAnwP3yRkffTzlKUHEtIrSQJtdwQ=;
        b=ZLKFYjga9etHuh635vu2T0JrYwlPf2rni6FKwzC7idA2Xo8UTSDXgabL1D+hyCzaeU
         e5o4gjBSk3twhjLLtV2vaJfGsMIpMsZRz7dU6sgwi4k2UkQOt7La1SpqWzcKuTSH77qc
         rBcmys10E82btt4yHRtPAU+Q0LxEtI8+ONMe3XXKDG+CsPqDNakFpYW5Q+gGwAef2YA/
         lpYCzIHEwg/6CCz73vMlkeDsoym5O06oGIf+eN/xzX5k8gDVdCNJMUvQcwUx2BJCcjXz
         vuBfSZCKmcd+xD9sgYoINY0qRhJhCG1MNdTHH8eTkPbtYg/e6u/a7mktlTGW00q8nu7H
         wG9g==
X-Forwarded-Encrypted: i=1; AJvYcCXJbHkWNl3chI8ANxs7hfWUK1lU0c4bQ3P6nzn72Wmh89i/16OwR9/AQk8Ho0ImZBkLtq7Y27XiuVw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyM8oCJL3Tt+BM8GoHgePyPtwDviPnMGoJqNWU9Tjj9tV7awQax
	5cNkTWsdNlSA+SYbSlSZYCSLD0sfXo+Sagf39qMBvis68ZVUnVLXiKxGHLB6Bop5OPg=
X-Gm-Gg: ASbGnctDpEM9CLkTekSZTITWjGY5i35vzYWaMSDLnJcQs7kvACxFsM6o89vrY291n1b
	GxijAM8H4DBeS3GvbdunJlSk0VnODz+RS8k3YJwnYNcarmumTPpPXWbxIdgz/dL2l66m+hwwXmN
	9gMj7IhHzfo1SOhoGg+Lb/XcyrXCoBLIWLPjegclBEE/P9CXid8PHCAR5m5t5RwkPEW6t2HcUsc
	EvkRvYvSfnsUB/fz2/rmkonhSlBqrRPlDJOt6fBlOa6EZA7j3J2DLy8AQfZVhmJ94xnVRFyXgJD
	AbwIjlfeVljNKH+9+COfGNSqt4WfYXoHjUcKLNS2yppv8/YSVZmvn7nuPXnEWCgp
X-Google-Smtp-Source: AGHT+IFokfHrS0cqFKUDrcGnm0bjUiSThIlPHjvO9RTk66q9cyYFiPgwK1o9zc41Z294fx1ovdpLTA==
X-Received: by 2002:a17:903:1aec:b0:22d:e57a:27a2 with SMTP id d9443c01a7336-231de36bb6bmr358484745ad.23.1747940632165;
        Thu, 22 May 2025 12:03:52 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e9736esm111879155ad.149.2025.05.22.12.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:03:51 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 22 May 2025 12:03:41 -0700
Subject: [PATCH v3 7/9] RISC-V: KVM: Use the new gpa range validate helper
 function
MIME-Version: 1.0
Message-Id: <20250522-pmu_event_info-v3-7-f7bba7fd9cfe@rivosinc.com>
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
In-Reply-To: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_120353_181620_0248832C 
X-CRM114-Status: GOOD (  11.46  )
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
index 15d71a7b75ba..163bd4403fd0 100644
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
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
