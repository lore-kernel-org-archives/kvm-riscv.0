Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F132C83F1A
	for <kvm-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 03:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4OsYuiraEqtjgcHa7L/eWZeaxNkO4oYEpQoqCqCx96o=; b=K/H2fNYu1lKlUj
	jOuc13wFotQljrecanuNx3ZA71hdJudvjdXsoJ3AVvs5GiwBL4BjTRovaePhYPiqMOUURbqrdV7eU
	KV/1bOwgcIEm9cc9I5tKaOgXBBp1L7neLBIlk6NJk51Ko9jq7orgmCWRIREbzg3A+sxBLuqy3q/i8
	O0PezA0WVteOb0V24nJQ7XVgOGrNKh3Qg0rZgLzHtITe6IHdLTJJoVrgIo0I/w8xy3S4g00CJ0eed
	7TYTJWWoAv0uFowY5fI10UaCDWgf1vPIVH4RDypDZukawTWEs9gsOB8SvjYXpA8nKGoHJFWnknBSW
	pVwxdOILrElVBa9lf6YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3lA-00000001BOH-3HoV;
	Tue, 22 Jul 2025 03:33:44 +0000
Received: from mail-pf1-f180.google.com ([209.85.210.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3TY-0000000197U-0iEN
	for kvm-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 03:15:35 +0000
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-73c17c770a7so5716006b3a.2
        for <kvm-riscv@lists.infradead.org>; Mon, 21 Jul 2025 20:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753154131; x=1753758931; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SzDB3T8h1PmSiiQR5aHwi6QPgnFacs+893qWZ0jSQcw=;
        b=EkVkXzhl38H/z3/EI1BlDCByiI3GxbHRYoCk26z+iZMKfhUgkKxtxJb+dCTlFX94+W
         BvTzUIhHqrdk8OLNiCB4Kzr5zelnxFJ1GFGBqbSMkiP3yKnCdD41A8NKHbYC47JOmNTE
         0Wl6royDviIBc3AiXD6tI6hSPSX0OWVh4F7dsTJn23mwjMOOK+/sixzN45MbHYsIkZqD
         Kjq3NeacXaGCQs5a7k75GB64rZQH3pOVy6TIFCEH8tU1oBaRDv/jfWLvW6MrQA2hE18O
         NKNC8/2y+/+vdjQpDW9UR7MJp/PvpyqRgfITCXwxGeqDFslFar+vcVSBtUXKl5+bPKo7
         GBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753154131; x=1753758931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzDB3T8h1PmSiiQR5aHwi6QPgnFacs+893qWZ0jSQcw=;
        b=F1eE2tVFtE9eK/Rm4oxoaDFJ23hrl/PTBUti1+oSriG1vb8IazGFwJDiI6MpkDoZd5
         vNbW9jguG82zJ2Bf8CdOobKX1gUAK971g5RiIe3kUOwINBIxLhXgifB4l4TfeH6Nb5tq
         YvLkzLhoU5QLDNg1cnpgUxBwyJ705F2advXhikKjGPXLAKcCBnZ7vZhZcngYraQFH2t7
         s6Mqd9BIAElBbnq+Ul3oI320+RJLpeyOAQ/XJ8jkwK/xfdzQa2xACuwHjV63MTH56sOe
         nm032uiNnPIPg7rs3WMCqZv0mA7RttvdkWU1ohw5BBkYxxfedXrUzv+pmLdg6GFp6yGn
         ufaw==
X-Forwarded-Encrypted: i=1; AJvYcCXdVvtD+1R2p+VlwdDWeUHQWc70tODC2iHp5fkWGWNvRzmEmWQ+1Hwc2gfiMg77n2uoyg6p6rk31Ks=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzz+QpwArYUCjOhujBgoHquIiqFx6Ka+S/gjh0nH16CPTeT35JD
	c3kLUTSxFKeCRtrqD0DIiYeJUjRr5Ht+BLBM4y+R4bgex5DwEWjl/eEvNTvUKjUgNkk=
X-Gm-Gg: ASbGncs3BULrEJEX5byyNaaSbl6Ie2qO+ji4+eBCvj8omozqtZ6Ist8XA39qFKOJOZ4
	+CkxVscgcA/Yzsh+y0xR0t8C0vsWrgvkbCHnNkhyrEecnjweCwmAz5gkoSQy48JrUTXXaELAahp
	QIZxljtH6utDfH3xNUYKsyA7fqS7OF1tfsAA7myc50OT2tvzJ/Dj4LsipHHQozjykaIGXuG2nYg
	cT2ViaIJ+ctPoli8Rgt4rTBU+oXDdP20q/0ghleFmNks8FNrERpgfMM48sPH/cYomqF4mr0A/IE
	9AbEq+7I9rDF0RmoLaGbShnM9LIpNP1XiYYDQedsj4pbZbKYmxy2SWVGzdNgU6t0AD5TgXrCOIw
	YTJ1acirtOmxdl7uJJn0us+0mU8Kn1VrI9a8=
X-Google-Smtp-Source: AGHT+IFIrVKrPK9UdCTELOyVWNX8T+lBXipMNBQiQT8fVWHbL9rvRg5zysIp/cvj2jz89NoBA/hgbQ==
X-Received: by 2002:a05:6a21:2d4a:b0:215:efe1:a680 with SMTP id adf61e73a8af0-2381143ed4emr32571364637.16.1753154131380;
        Mon, 21 Jul 2025 20:15:31 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2feac065sm6027612a12.33.2025.07.21.20.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 20:15:31 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 21 Jul 2025 20:15:22 -0700
Subject: [PATCH v4 6/9] KVM: Add a helper function to validate vcpu gpa
 range
MIME-Version: 1.0
Message-Id: <20250721-pmu_event_info-v4-6-ac76758a4269@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250721_201533_050174_06A81A3F 
X-CRM114-Status: GOOD (  12.73  )
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

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 include/linux/kvm_host.h |  2 ++
 virt/kvm/kvm_main.c      | 21 +++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 3bde4fb5c6aa..9532da14b451 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1387,6 +1387,8 @@ static inline int kvm_vcpu_map_readonly(struct kvm_vcpu *vcpu, gpa_t gpa,
 
 unsigned long kvm_vcpu_gfn_to_hva(struct kvm_vcpu *vcpu, gfn_t gfn);
 unsigned long kvm_vcpu_gfn_to_hva_prot(struct kvm_vcpu *vcpu, gfn_t gfn, bool *writable);
+int kvm_vcpu_validate_gpa_range(struct kvm_vcpu *vcpu, gpa_t gpa, unsigned long len,
+				bool write_access);
 int kvm_vcpu_read_guest_page(struct kvm_vcpu *vcpu, gfn_t gfn, void *data, int offset,
 			     int len);
 int kvm_vcpu_read_guest_atomic(struct kvm_vcpu *vcpu, gpa_t gpa, void *data,
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 222f0e894a0c..11bb5c24ed0d 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3361,6 +3361,27 @@ int kvm_vcpu_write_guest(struct kvm_vcpu *vcpu, gpa_t gpa, const void *data,
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_write_guest);
 
+int kvm_vcpu_validate_gpa_range(struct kvm_vcpu *vcpu, gpa_t gpa, unsigned long len,
+				bool write_access)
+{
+	unsigned long hva;
+	int offset = offset_in_page(gpa);
+	gfn_t gfn = gpa >> PAGE_SHIFT;
+	int seg;
+	bool writable = false;
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
