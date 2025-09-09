Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29EF3CAC589
	for <kvm-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 08:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aKmDj/0tPugUqhrXr9yfjDncYZSL+yGDVVMlDYr9Un4=; b=g9WULzC0gO6rdw
	FsUDzQPz0UtxIqSBMxa1ZGDpnfljZdt6FeuUEfHE7P5R4uZjz4HouDhpKWagI6c1HLl45DXBW7AEq
	6jOc5lf4opnN2nnHzYQ0p+wewkwVKSN2IBveCvKhMf2M07P3LmfzZSS75TagcmNsjqUQUGnecELDd
	WXWdFy+E5mHebhwmhQ601DUKlIwj37bDYUmFVWR6AQy7X5Z4WTsK81EeKosQJIIZrjcW71+zsn82q
	GjEh3j3IiIITHQjVwtZl6VDFmn+cDegi2gVyTPeSdvXXc1RYC4/InNVz5bSaJuQe4qNKuRZxs10gs
	8OqcWf0PIwwMwxvKQH5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvtRA-00000005TKY-3ue2;
	Tue, 09 Sep 2025 08:10:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsOD-000000051uY-1UnT
	for kvm-riscv@bombadil.infradead.org;
	Tue, 09 Sep 2025 07:03:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=53RW3r37vVd/uOGEJeJ40vwWJphKZpVppDFV/CpDLs4=; b=a5cdOKhZSHOqJgLhtvf45KRXuD
	bmcpNJQnp2DFT1CMiSS1THxexhinjaZ/ZM8IT4/+RGEOvc77xJMtO+Y6hDmYO+hMOjuENEIwfTSwv
	pNxtdbUCdEHfvYTy6+agsyVan9SsLlr96WD51JIFn0OUNqpnsRaU6KXa6bg35HPfci+Gp6t0lzPV5
	6Irv3IE2X9Tr2CVp8w16oR13rjpUDipbzo0xy44StIx+DvcmSWuZhuu3hBwG0pFKSi6ykcAOtDWjo
	HsuWbkIf0U79VhOlNPxHEFPiWjdh7qiR3UxIgnb9VEoegnLGo4mWyLvLfrZwMX69SSk+GcCU4mMtl
	dqFxig1w==;
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsO5-00000005ECW-270y
	for kvm-riscv@lists.infradead.org;
	Tue, 09 Sep 2025 07:03:39 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-32b92d75eaeso3561340a91.0
        for <kvm-riscv@lists.infradead.org>; Tue, 09 Sep 2025 00:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1757401410; x=1758006210; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=53RW3r37vVd/uOGEJeJ40vwWJphKZpVppDFV/CpDLs4=;
        b=HDfWDUFrNilJc5GwpfNjwrpmCIsOqsmEDJvRdOvypGgeRG3uWyFgPMtWXnjt3uTSOv
         R8cN+sYmk6t2Q6MWZw3jkv41YArhhmU2ly/gbTu/Ne3QezYAy2nIdYs71jiw6fZFqhHV
         ooWC1Nry5dnZ1k+6M43kRA5KYSWKd3rhYCWbBwwDdrGfzfiF8uqgce7zjuF+YREej+ah
         /+a52a6sHdxDF3ta+D5Q9JZMoze8rZ+pMSnROzcVsN/M6+wvt0Z24qeK8f8iktnP9Prf
         TDTC8mj3ffc4WOpryfyYyaprNJsAN2aEal1TAa/dpxWjX2Yc9doIEhPsPwXmSI1cIAjd
         3WKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757401410; x=1758006210;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=53RW3r37vVd/uOGEJeJ40vwWJphKZpVppDFV/CpDLs4=;
        b=UzaJa6vn8FVvHua9NlSqwutbEZ10K2h69Rf+sqZN2nsWiXm3lnmKfAAq3FGRfFXw+4
         L9tSsCFG9K2SayGxhG1Y/zzPpvw12R+xLc4o5U7ZAB8LUQoteWLXnhspx1GN29aVlB8e
         IMBa+FW4JrUI+VzAhJ2dd3STNARIzHHxQos8exw1x6ob8wBdpoIUlpMsG3375v8xRCTS
         10XDaOjt3HZgW3fmof2Zd5ZjJo8wfJs1IpRJml1ULgKV9PEU42qZbt/ekguJ7XxM7IeO
         CpVkIbpuf2GOKSEnwG2hbhtMUHtKsApDbAzmJpQ1UHoI5mSBA2mk5Cc0wrDQSBbnn08j
         +Y8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWxKdoceSMNPKETAdMA6whwYdj94YquYQebrNFqJFempHxpTVFTGZnjWtg3hw0jl+W+oizUZGIDc9s=@lists.infradead.org
X-Gm-Message-State: AOJu0YxiLeYlXfiTskNtkqdu1p90xW7VmrUtbZdrJulyumao21azBnO1
	yRYA21jSpjCCnZWB9qFg//CbD5a6HEADa+x0sEZ8c6fm0Fvf8dnoWUqvbTbGJY6pZCGk+VtnKGl
	pK3EH
X-Gm-Gg: ASbGnctt1aOo/k3lTy5OAbAO0/dLlodP8YyHrP0B8H0LLAKtkkBY7gKK7cl3krrVxpc
	V4bAaVADDHl5NW6VfSr7VACLlj5WsBWrGPvbf0cXTi8FyOn3wNfCBGVhS9hYiJcSTX5HYpoPhwz
	aWWnigPoDnV2JEPaws0tP7Jzg140qPP8nJrSdimYLU1ZpNzp7X+fDfQFEjjbRQV4rHFrQSttTOA
	Cn4dQqHjgovWByNeJ6AvYK/qwkcnjDuFObCMbLeSU4CS+o72YK73ayPsYj37+MCRG0/E0qDo5g5
	xuzGr4d5J+fwexwyB4W647UPxhNnJc9EabRWjPFcUVwVVrICCZu6v1zux5Nbd/Bv5d9H2sIU5vb
	GX8KJ5etZUdqg/hYym8Iuhbab+sFwVZS9qNUqw9/ICDWlAw==
X-Google-Smtp-Source: AGHT+IEp7M2YTd5oqLJWntqYzx+W66KU/8IVhi9uG5EgartrnOvK3S6t6vrkn2Q3yP3sdZUpu5Y3+A==
X-Received: by 2002:a17:90b:48c9:b0:32b:96f2:e2c9 with SMTP id 98e67ed59e1d1-32bbe104088mr17623995a91.12.1757401410327;
        Tue, 09 Sep 2025 00:03:30 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-774662c7158sm1025535b3a.72.2025.09.09.00.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 00:03:29 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 09 Sep 2025 00:03:25 -0700
Subject: [PATCH v6 6/8] RISC-V: KVM: No need of explicit writable slot
 check
MIME-Version: 1.0
Message-Id: <20250909-pmu_event_info-v6-6-d8f80cacb884@rivosinc.com>
References: <20250909-pmu_event_info-v6-0-d8f80cacb884@rivosinc.com>
In-Reply-To: <20250909-pmu_event_info-v6-0-d8f80cacb884@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Atish Patra <atishp@rivosinc.com>, 
 Sean Christopherson <seanjc@google.com>
X-Mailer: b4 0.15-dev-50721
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_080333_794499_FE85D0D2 
X-CRM114-Status: GOOD (  12.51  )
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

There is not much value in checking if a memslot is writable explicitly
before a write as it may change underneath after the check. Rather, return
invalid address error when write_guest fails as it checks if the slot
is writable anyways.

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_pmu.c     | 11 ++---------
 arch/riscv/kvm/vcpu_sbi_sta.c |  9 ++-------
 2 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 15d71a7b75ba..f8514086bd6b 100644
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
@@ -432,19 +430,14 @@ int kvm_riscv_vcpu_pmu_snapshot_set_shmem(struct kvm_vcpu *vcpu, unsigned long s
 		goto out;
 	}
 
-	hva = kvm_vcpu_gfn_to_hva_prot(vcpu, saddr >> PAGE_SHIFT, &writable);
-	if (kvm_is_error_hva(hva) || !writable) {
-		sbiret = SBI_ERR_INVALID_ADDRESS;
-		goto out;
-	}
-
 	kvpmu->sdata = kzalloc(snapshot_area_size, GFP_ATOMIC);
 	if (!kvpmu->sdata)
 		return -ENOMEM;
 
+	/* No need to check writable slot explicitly as kvm_vcpu_write_guest does it internally */
 	if (kvm_vcpu_write_guest(vcpu, saddr, kvpmu->sdata, snapshot_area_size)) {
 		kfree(kvpmu->sdata);
-		sbiret = SBI_ERR_FAILURE;
+		sbiret = SBI_ERR_INVALID_ADDRESS;
 		goto out;
 	}
 
diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
index cc6cb7c8f0e4..caaa28460ca4 100644
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
 
@@ -111,13 +109,10 @@ static int kvm_sbi_sta_steal_time_set_shmem(struct kvm_vcpu *vcpu)
 			return SBI_ERR_INVALID_ADDRESS;
 	}
 
-	hva = kvm_vcpu_gfn_to_hva_prot(vcpu, shmem >> PAGE_SHIFT, &writable);
-	if (kvm_is_error_hva(hva) || !writable)
-		return SBI_ERR_INVALID_ADDRESS;
-
+	/* No need to check writable slot explicitly as kvm_vcpu_write_guest does it internally */
 	ret = kvm_vcpu_write_guest(vcpu, shmem, &zero_sta, sizeof(zero_sta));
 	if (ret)
-		return SBI_ERR_FAILURE;
+		return SBI_ERR_INVALID_ADDRESS;
 
 	vcpu->arch.sta.shmem = shmem;
 	vcpu->arch.sta.last_steal = current->sched_info.run_delay;

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
