Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E184C83F34
	for <kvm-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 03:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kL5mWE2J6aexLEhZlKaXxNhLkObk18c7rxm2NvDajkc=; b=FM7qVNXZ+Ahh9i
	6B7oKVbfrE0ofv1K1ZrEImBNhpVgj9yZWbR+RTQ2O76PbhrcgLZr039HshFKO8QHpGg09vhPIefvX
	FaOJ2Zbc1ZdG8fqgzBs2Td2VUAzdM/s36YEFu0afY1cAi4C6Uj9YeJCbrCTzuxLlXplDfSemYVcT7
	UfLVO2eh5I7h6QpGwIyUkPHtuCWEA3fEwCCQe50aZup7y14DKmmn6sIww4omZQjQTa6Eb0TKyo3PR
	rnyH2xVdc4z5t8pesmN2fSi78JsqDPGiYbrUFvn6n5rWBFP2HExW6luXSef9cn47ws0RHi/Nv+mrW
	7LW/OPxrGuYjMR1FfsVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3lB-00000001BOU-0YB8;
	Tue, 22 Jul 2025 03:33:45 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3TZ-0000000198c-0742
	for kvm-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 03:15:35 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-75ce8f8a3cdso1043883b3a.0
        for <kvm-riscv@lists.infradead.org>; Mon, 21 Jul 2025 20:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753154132; x=1753758932; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jhkogpIzLqmuw+J4yXbDtFu/+vtMV2ME5+zsyZigSm8=;
        b=yo3LNfvCTV89qAjQQOJd9LvhdruZvQgMlRztjseaXtavbsCrmHl7iwqYspvGm8ya1q
         mUS6sdQFlZuPKvZe9QsN5W4ADty2Om0JWQGK61eL6WY61cHbtnfyCY8eOg/v2NzMytM2
         m0rv1FE83EKrfgmijByrkmHr4eThZTZHW62glSTnkGqSxKRtHLA7v8E/UrAgx+MuWfWN
         NnGQab8G0euwCsdzFPP9WOS81tL2E87W614eXwej4DNlP/0Am8mjrKh21URdPTOvrYy1
         afZRMFjn84kpsQTZn3Q7oCqUJ4NxiFzuPzyGON277X6n3MBST7GVVGcJ6vvST/TdLRCP
         yinw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753154132; x=1753758932;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jhkogpIzLqmuw+J4yXbDtFu/+vtMV2ME5+zsyZigSm8=;
        b=Si59VScPksHqE4JjB4RHXp6iWCAzMcArsAjO27V0p2o4HsYiB0tXR1M1xUP6TNpsof
         WizAm738j/fp3g6m6KXR37vL31RzpSsHNYOyZqELWJpb5k78Zi8vUyxdeGQznVzjCY8P
         36PDkzKw+d8WiSl+af1paZqzAkfEOzjp38JNX18x5dU5RhxlzIR37JM6y029R4N9RxNf
         Ui2DEyoCS6I3sVgJjhc8YWG2zeMlkSXWC7G9wXI3TRK/vcGlEc8KmstLyVwtghmvpI/U
         66fjpQG9EZmkOSKuwjYtY2opxwZssbDcWyUcW9mlhNJ4agcmDlGbQrW0LEYmhVmy/0KS
         +RQA==
X-Forwarded-Encrypted: i=1; AJvYcCV+LwMYijNzeG0s8ZatlRbEpxGqbojPN+DpYTpXeBFjKNrn0qa+PYLg808gjtIVRnc5Y7Zm3sMn3u8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4oINNeb9TOJJjzYQb6XCmhUv+2Ophalc6OnIon5vIVtBWXIPt
	nMEhr39ywJIIQjUsdeACw0xtgiQE+Oo601DJ28bGYJ4vkVl+0KKxpnWVA6oatCSaWsg=
X-Gm-Gg: ASbGncs78QmmD6JX8MBF5wprk0QlZfPzXE6pUMZXXeUBN26FiI2tL9LPStGSOGxTIYW
	whm/U7tayRLnpub1/+I6Q/MxHTF6WTlYTSb7NUtR3SD1QhBy0/bFSOQoJdKvY+LzMZUjAJkxmis
	6RzOxukh92x2ArxdA4AM2VYqVXZWSvCSl/hHdcA5reTKj9XNU7j1EvhR5boVkXi+BlEyczrf+gy
	sB91KDfeuQvg91KVgW+kpikW2Am+YZKjHVK7jfmy4/4kwXStTJeM6206mCcZ+qtUqYj5lS6eqSC
	96tznwgthhlHihgjAE1FDlNwgmRoTbgBIOjs39uLzEb8pclOxZ2XeWQ2sarwgVGQZO5tdNTxPON
	z5pXyKdPPJN8FnZMArDuWFxuz6aMrlOg2S48MFbK2v5ifhw==
X-Google-Smtp-Source: AGHT+IFymBDNRC6n0aOx6RiDMH5WWpmPfPiOTR2NPfmMJh6ymjUAaxXLpsltj/PI9MkAWHdOyBXsLA==
X-Received: by 2002:a05:6a20:7d8b:b0:220:5c12:efa3 with SMTP id adf61e73a8af0-237d89607dcmr37332092637.38.1753154132341;
        Mon, 21 Jul 2025 20:15:32 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2feac065sm6027612a12.33.2025.07.21.20.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 20:15:32 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 21 Jul 2025 20:15:23 -0700
Subject: [PATCH v4 7/9] RISC-V: KVM: Use the new gpa range validate helper
 function
MIME-Version: 1.0
Message-Id: <20250721-pmu_event_info-v4-7-ac76758a4269@rivosinc.com>
References: <20250721-pmu_event_info-v4-0-ac76758a4269@rivosinc.com>
In-Reply-To: <20250721-pmu_event_info-v4-0-ac76758a4269@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_201533_571645_4B378C56 
X-CRM114-Status: GOOD (  11.78  )
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

Reviewed-by: Anup Patel <anup@brainfault.org>
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
