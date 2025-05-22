Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE6F4C54E65
	for <kvm-riscv@archiver.kernel.org>; Thu, 22 May 2025 19:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LD9lKyOA0GlLmTNXFs4THPCWZppIjKImHWgUdgYuWjc=; b=1YlMX5gzYxSGpU
	Djt8CQIcJN7y+fMCX8LJ2RlztE4MV8hxGTsUsm9czkHZJaWJOFTi4gsm57gNqhtsVXFl1CijYc5eB
	kAVpMswRteGzduMWoone8wS6s3Awj/D17phuV+nuO9az1A0nAiER/ONcwCSjKdT1oBR30TqnU4pmp
	c5MOUgU1WsG1slMoGjrnVfvvvbZwT86bGKzfreVcbv3o/pla9pKrVEtR3zV9d1Fx7ibo9ap3Pr2SA
	W+pOdsmjd6/HgPtcvN6VY3InuMis+N5ucTyPB0wp3o/k5qF+iBB7t6HdRkJMPorXKsuVWK0corzk8
	lKFIuCU+NqKNDs/HyBnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIBQv-000000020F2-2BDR;
	Thu, 22 May 2025 19:18:25 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIBCq-00000001wRP-0Rnz
	for kvm-riscv@lists.infradead.org;
	Thu, 22 May 2025 19:03:54 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-231f5a7baa2so48163575ad.0
        for <kvm-riscv@lists.infradead.org>; Thu, 22 May 2025 12:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747940631; x=1748545431; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vZzBI2/8zxd6TBktJeo9hVnWnoPSXGrqMFkDVMKCuo8=;
        b=wfiLjGnv7axN+6eoujhMPT+XM84q4ugt20Cr0pewl6dq9M+tcGSzMaiCL6u6+Xi3M3
         mvMWZlcRJnvA+XXSkg5wnvZhK6HzT27XzOSeDHrMbmDmf9qbkCKdawXTxCVc1mUM7Xk4
         4uSXPzWjMYO1vXqyTfjBGlo4e6QovcmnTyp8nCDTGj5TuHeEAqmuy0+HCtNg4R3tfo+Z
         ldbU65oh9vfTFa4GRGMUvMGMThYV0btNRH28bUrbI8lBon2qef9wSUy6a928LUJtokJo
         q7AvvC0/OKjyx7x5mTkNhwVCjxpwHxNFMJbeVoQe3W6T99V+T49X5vfcphfA7pWLKl8m
         hr9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940631; x=1748545431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vZzBI2/8zxd6TBktJeo9hVnWnoPSXGrqMFkDVMKCuo8=;
        b=e3fkfJ89Kut6wRbKZNnZpoLLKE1mXq2vJhnJ6MJ+IpCWfIO+HP2+EbfMiYFv28o+cD
         fBHI5yHfXX0nUDnM22UTPGD5QO/TzNlcht9qjcBiefEfvufGR/1p9+40el1GQc+M/hWR
         SQJGYfRL/K3ptovh7mZdHpPcQ/mBbBXA+2XTdtcyZXudLDNXPOCsj39fQqdNbxV7iUP3
         cvFW67UYW2i5m8lMq2J2vWlnuzGJrIPxOsTSKdzoM2r/ePrgwQaZOXM0SqNp1p2/byhH
         xgO/ZNzu3JUYOazJKFibUze9TsEM7AgSJVk5pcaEjlpCqRgSIQniRHKyjUrqn3lUMx1C
         RzLA==
X-Forwarded-Encrypted: i=1; AJvYcCUjQIw80vKMWYNAJ/7AJyQkqy+WUCw42ydjqByjuqPYoMhOU3O8JD46uj6cMbiUMU7N9VLoDg9jznM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwYVf2UNPZsdQXRoR5bVIpRb2vQDAi6b1YUSqLpJJQOhhTxyL5P
	KFlR+UZPv6zeP+aJMGV17zDYSfAbMyLF4Nl6JzYnYyOLd3D5PF1prFCbT6/M/V+Y+K0=
X-Gm-Gg: ASbGncvAhDTKmYbYyyjsawkvARiql9Z9Hu+N5hjJpXk+hF/44MYjyG72cIEbtM2Or39
	J/p5GyG2i+yavoL8YWTNfjk19JIEb8NkpqiScyoCKx8TVM3cERVv8PXnxJ5vFKqMsikf8NzKfz/
	eL7u6b3CFEmnXgJtiuZp72TiSee8iDQsI1+zU5D2ERWzRqPijvMXr5u9OIpHyqCJnNDRJKw5q9V
	nsEqeJDHM6R6e8oOzpMiFPKQkRgXJ5qSAIcT+flOww0ldE1LKkzjQydLe+IttvrA6eoj2C1kKFZ
	+5v+JMdJjB7e66uOgqdqyJMX5750UrdSgJZrgrk1RR2ZT3QjbPpzR7ON/G930CuF
X-Google-Smtp-Source: AGHT+IEr79nTwwFBEJoxFRK5RNwqD1jq2SDcjYk7D0rQW6WwVVGL0IpJIiwt2oBQtuzcW3AhD+odEw==
X-Received: by 2002:a17:903:94f:b0:22c:3609:97ed with SMTP id d9443c01a7336-231d43d9bccmr330946415ad.30.1747940631058;
        Thu, 22 May 2025 12:03:51 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e9736esm111879155ad.149.2025.05.22.12.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:03:50 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 22 May 2025 12:03:40 -0700
Subject: [PATCH v3 6/9] KVM: Add a helper function to validate vcpu gpa
 range
MIME-Version: 1.0
Message-Id: <20250522-pmu_event_info-v3-6-f7bba7fd9cfe@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250522_120352_175318_D9B50014 
X-CRM114-Status: GOOD (  12.47  )
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

The arch specific code may need to validate a gpa range if it is a shared
memory between the host and the guest. Currently, there are few places
where it is used in RISC-V implementation. Given the nature of the function
it may be used for other architectures. Hence, a common helper function
is added.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 include/linux/kvm_host.h |  2 ++
 virt/kvm/kvm_main.c      | 21 +++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 291d49b9bf05..adda61cc4072 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1383,6 +1383,8 @@ static inline int kvm_vcpu_map_readonly(struct kvm_vcpu *vcpu, gpa_t gpa,
 
 unsigned long kvm_vcpu_gfn_to_hva(struct kvm_vcpu *vcpu, gfn_t gfn);
 unsigned long kvm_vcpu_gfn_to_hva_prot(struct kvm_vcpu *vcpu, gfn_t gfn, bool *writable);
+int kvm_vcpu_validate_gpa_range(struct kvm_vcpu *vcpu, gpa_t gpa, unsigned long len,
+				bool write_access);
 int kvm_vcpu_read_guest_page(struct kvm_vcpu *vcpu, gfn_t gfn, void *data, int offset,
 			     int len);
 int kvm_vcpu_read_guest_atomic(struct kvm_vcpu *vcpu, gpa_t gpa, void *data,
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index e85b33a92624..3f52f5571fa6 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3301,6 +3301,27 @@ int kvm_vcpu_write_guest(struct kvm_vcpu *vcpu, gpa_t gpa, const void *data,
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_write_guest);
 
+int kvm_vcpu_validate_gpa_range(struct kvm_vcpu *vcpu, gpa_t gpa, unsigned long len,
+				bool write_access)
+{
+	gfn_t gfn = gpa >> PAGE_SHIFT;
+	int seg;
+	int offset = offset_in_page(gpa);
+	bool writable = false;
+	unsigned long hva;
+
+	while ((seg = next_segment(len, offset)) != 0) {
+		hva = kvm_vcpu_gfn_to_hva_prot(vcpu, gfn, &writable);
+		if (kvm_is_error_hva(hva) || (writable ^ write_access))
+			return -EPERM;
+		offset = 0;
+		len -= seg;
+		++gfn;
+	}
+	return 0;
+}
+EXPORT_SYMBOL_GPL(kvm_vcpu_validate_gpa_range);
+
 static int __kvm_gfn_to_hva_cache_init(struct kvm_memslots *slots,
 				       struct gfn_to_hva_cache *ghc,
 				       gpa_t gpa, unsigned long len)

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
