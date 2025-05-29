Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5647C54FB3
	for <kvm-riscv@archiver.kernel.org>; Thu, 29 May 2025 22:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8xxqpbuXUH9dLUg90qDmmfGRzkyr26iSJdBom7Ey4Ug=; b=wvT5zJK+Zy6X/J
	pE67Mxge2w2g8cJUueTyX70tWxkMMxnml9YcbMV5PgHEeJeTW3ZlKPEyuQXFo7SA0FpqrCao86RG7
	XFOA69PHuCQfuYbrleynwJJ1g2eLkIjS6fpiuSDePIQurfHU4Fup8y30GV2WKnOmO3bwIOCNmx7Gy
	34xzLjYxpBoiTJLUmKzsFaAMMk+OzjUr3t0iMKV/rzshaFKIy/hp1wGg+pzidZMbLgVIRMRqVmDmW
	H2Ng4mvCIN42Ljsv4uwEctqo1R1S7wwSauUduSOH4hTh1LNRF3/3kA/K8RYVVecbuuZ/jdxs4qyeW
	krhC5zy9RdYJ69V0M7fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKlbJ-0000000GcP2-1Bn8;
	Thu, 29 May 2025 22:19:49 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKlbG-0000000GcMj-38Xp
	for kvm-riscv@lists.infradead.org;
	Thu, 29 May 2025 22:19:47 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b2c00e965d0so1004488a12.2
        for <kvm-riscv@lists.infradead.org>; Thu, 29 May 2025 15:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748557185; x=1749161985; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=4p/1kmWiRyp+7Os+63Z9VcctJJrswAn8XSplAjfBM7Q=;
        b=ZxmRS4vN1G+5XTfQzMJMnAmDNak1baF5vIQqij1GuA2N1vXk9SjLWTdhC5fi+4jhDX
         5/eYHHG8wCN1NcRINTe8DX+QL+KW+GbFQ3VLk+O+gzfunR7e6dPwINWqIHPGNo3y0052
         HAEHlvR0JMwRNMnrpdQeSYn+Rkn8Zm6/WsPgjegvGQigd7QYeZOvs4EbifHC5Jtgw8e8
         ILFj2JJmnr0KEus0X+ejftMmFhhpmqR1YjdiucPC3fADMAgOjamTAOnmYWhhXJZwOMM0
         TcIpcyDfWbls35Qf9dLKNtfjD0YsRacgB1uF4rIh+t341sZY6IMiL032rGZEmTd67RWk
         0vwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748557185; x=1749161985;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4p/1kmWiRyp+7Os+63Z9VcctJJrswAn8XSplAjfBM7Q=;
        b=C4JDCvB83rFoMwl4D2SKdjnw2vgULgND4i2kKSk0+gBlxC+cRGAQX1oQjh6WvXin85
         zWzJCcDdaNYlHmqu+FjTrdRb49vT0n+TX9aPGFwDZyafewNubidcRyLOkQV9TdJ52v1j
         T/iD6blRUloHO+EJM5S84AqRM7aLUsrk38PdH4AA6j2Dx6yjdlNbXDajAzekWxM7VhVf
         Ch9FIQiyxXRDEYLDmtgWVN9Vt8Fai8QdBwPOe0pwo41n7ZzoiFp1j1baCVSVIMBxRd+T
         eBeFCg0eGJGo3MP29JeRhuMqzJdd2w38A9pc6nrSTeajMvCSO6e1tCm4kkoa7aUHwXwz
         yVDQ==
X-Gm-Message-State: AOJu0YwmF1gz3LtAROsvjNWPT+o2zeHDaC1o2k2iboXUw95b+LiPzxbW
	JGdjmYosqm3nRqCmCZORLlO2637oadL0goYkOpmWZ/zQqxCDHma+Q8tcw/7G9DegDeKybKPxdY6
	g9iQqDg==
X-Google-Smtp-Source: AGHT+IFXNSXg+8D9lEWdatr1QLsM7ddqiFyaZCdJAHYIj0LYqIW7eMgV61Z0Am2ItpUnNaFhrVXuA51YgQQ=
X-Received: from plrd21.prod.google.com ([2002:a17:902:aa95:b0:234:e3a2:5b21])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2312:b0:234:9656:7db9
 with SMTP id d9443c01a7336-2352990511fmr17903355ad.32.1748557185478; Thu, 29
 May 2025 15:19:45 -0700 (PDT)
Date: Thu, 29 May 2025 15:19:16 -0700
In-Reply-To: <20250529221929.3807680-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250529221929.3807680-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250529221929.3807680-4-seanjc@google.com>
Subject: [kvm-unit-tests PATCH 03/16] x86: Add X86_PROPERTY_* framework to
 retrieve CPUID values
From: Sean Christopherson <seanjc@google.com>
To: Andrew Jones <andrew.jones@linux.dev>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, "=?UTF-8?q?Nico=20B=C3=B6hr?=" <nrb@linux.ibm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	kvm@vger.kernel.org, Sean Christopherson <seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_151946_792902_BE51850D 
X-CRM114-Status: GOOD (  13.22  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Introduce X86_PROPERTY_* to allow retrieving values/properties from CPUID
leafs, e.g. MAXPHYADDR from CPUID.0x80000008.  Use the same core code as
X86_FEATURE_*, the primary difference is that properties are multi-bit
values, whereas features enumerate a single bit.

Add this_cpu_has_p() to allow querying whether or not a property exists
based on the maximum leaf associated with the property, e.g. MAXPHYADDR
doesn't exist if the max leaf for 0x8000_xxxx is less than 0x8000_0008.

Use the new property infrastructure in cpuid_maxphyaddr() to prove that
the code works as intended.  Future patches will convert additional code.

Note, the code, nomenclature, changelog, etc. are all stolen from KVM
selftests.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 lib/x86/processor.h | 109 +++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 102 insertions(+), 7 deletions(-)

diff --git a/lib/x86/processor.h b/lib/x86/processor.h
index 3ac6711d..6b61a38b 100644
--- a/lib/x86/processor.h
+++ b/lib/x86/processor.h
@@ -218,13 +218,6 @@ static inline struct cpuid cpuid(u32 function)
 	return cpuid_indexed(function, 0);
 }
 
-static inline u8 cpuid_maxphyaddr(void)
-{
-	if (raw_cpuid(0x80000000, 0).a < 0x80000008)
-	return 36;
-	return raw_cpuid(0x80000008, 0).a & 0xff;
-}
-
 static inline bool is_intel(void)
 {
 	struct cpuid c = cpuid(0);
@@ -329,6 +322,74 @@ struct x86_cpu_feature {
 #define X86_FEATURE_VNMI		X86_CPU_FEATURE(0x8000000A, 0, EDX, 25)
 #define	X86_FEATURE_AMD_PMU_V2		X86_CPU_FEATURE(0x80000022, 0, EAX, 0)
 
+/*
+ * Same idea as X86_FEATURE_XXX, but X86_PROPERTY_XXX retrieves a multi-bit
+ * value/property as opposed to a single-bit feature.  Again, pack the info
+ * into a 64-bit value to pass by value with no overhead on 64-bit builds.
+ */
+struct x86_cpu_property {
+	u32	function;
+	u8	index;
+	u8	reg;
+	u8	lo_bit;
+	u8	hi_bit;
+};
+#define	X86_CPU_PROPERTY(fn, idx, gpr, low_bit, high_bit)			\
+({										\
+	struct x86_cpu_property property = {					\
+		.function = fn,							\
+		.index = idx,							\
+		.reg = gpr,							\
+		.lo_bit = low_bit,						\
+		.hi_bit = high_bit,						\
+	};									\
+										\
+	static_assert(low_bit < high_bit);					\
+	static_assert((fn & 0xc0000000) == 0 ||					\
+		      (fn & 0xc0000000) == 0x40000000 ||			\
+		      (fn & 0xc0000000) == 0x80000000 ||			\
+		      (fn & 0xc0000000) == 0xc0000000);				\
+	static_assert(idx < BIT(sizeof(property.index) * BITS_PER_BYTE));	\
+	property;								\
+})
+
+#define X86_PROPERTY_MAX_BASIC_LEAF		X86_CPU_PROPERTY(0, 0, EAX, 0, 31)
+#define X86_PROPERTY_PMU_VERSION		X86_CPU_PROPERTY(0xa, 0, EAX, 0, 7)
+#define X86_PROPERTY_PMU_NR_GP_COUNTERS		X86_CPU_PROPERTY(0xa, 0, EAX, 8, 15)
+#define X86_PROPERTY_PMU_GP_COUNTERS_BIT_WIDTH	X86_CPU_PROPERTY(0xa, 0, EAX, 16, 23)
+#define X86_PROPERTY_PMU_EBX_BIT_VECTOR_LENGTH	X86_CPU_PROPERTY(0xa, 0, EAX, 24, 31)
+#define X86_PROPERTY_PMU_EVENTS_MASK		X86_CPU_PROPERTY(0xa, 0, EBX, 0, 7)
+#define X86_PROPERTY_PMU_FIXED_COUNTERS_BITMASK	X86_CPU_PROPERTY(0xa, 0, ECX, 0, 31)
+#define X86_PROPERTY_PMU_NR_FIXED_COUNTERS	X86_CPU_PROPERTY(0xa, 0, EDX, 0, 4)
+#define X86_PROPERTY_PMU_FIXED_COUNTERS_BIT_WIDTH	X86_CPU_PROPERTY(0xa, 0, EDX, 5, 12)
+
+#define X86_PROPERTY_SUPPORTED_XCR0_LO		X86_CPU_PROPERTY(0xd,  0, EAX,  0, 31)
+#define X86_PROPERTY_XSTATE_MAX_SIZE_XCR0	X86_CPU_PROPERTY(0xd,  0, EBX,  0, 31)
+#define X86_PROPERTY_XSTATE_MAX_SIZE		X86_CPU_PROPERTY(0xd,  0, ECX,  0, 31)
+#define X86_PROPERTY_SUPPORTED_XCR0_HI		X86_CPU_PROPERTY(0xd,  0, EDX,  0, 31)
+
+#define X86_PROPERTY_XSTATE_TILE_SIZE		X86_CPU_PROPERTY(0xd, 18, EAX,  0, 31)
+#define X86_PROPERTY_XSTATE_TILE_OFFSET		X86_CPU_PROPERTY(0xd, 18, EBX,  0, 31)
+#define X86_PROPERTY_AMX_MAX_PALETTE_TABLES	X86_CPU_PROPERTY(0x1d, 0, EAX,  0, 31)
+#define X86_PROPERTY_AMX_TOTAL_TILE_BYTES	X86_CPU_PROPERTY(0x1d, 1, EAX,  0, 15)
+#define X86_PROPERTY_AMX_BYTES_PER_TILE		X86_CPU_PROPERTY(0x1d, 1, EAX, 16, 31)
+#define X86_PROPERTY_AMX_BYTES_PER_ROW		X86_CPU_PROPERTY(0x1d, 1, EBX, 0,  15)
+#define X86_PROPERTY_AMX_NR_TILE_REGS		X86_CPU_PROPERTY(0x1d, 1, EBX, 16, 31)
+#define X86_PROPERTY_AMX_MAX_ROWS		X86_CPU_PROPERTY(0x1d, 1, ECX, 0,  15)
+
+#define X86_PROPERTY_MAX_KVM_LEAF		X86_CPU_PROPERTY(0x40000000, 0, EAX, 0, 31)
+
+#define X86_PROPERTY_MAX_EXT_LEAF		X86_CPU_PROPERTY(0x80000000, 0, EAX, 0, 31)
+#define X86_PROPERTY_MAX_PHY_ADDR		X86_CPU_PROPERTY(0x80000008, 0, EAX, 0, 7)
+#define X86_PROPERTY_MAX_VIRT_ADDR		X86_CPU_PROPERTY(0x80000008, 0, EAX, 8, 15)
+#define X86_PROPERTY_GUEST_MAX_PHY_ADDR		X86_CPU_PROPERTY(0x80000008, 0, EAX, 16, 23)
+#define X86_PROPERTY_SEV_C_BIT			X86_CPU_PROPERTY(0x8000001F, 0, EBX, 0, 5)
+#define X86_PROPERTY_PHYS_ADDR_REDUCTION	X86_CPU_PROPERTY(0x8000001F, 0, EBX, 6, 11)
+#define X86_PROPERTY_NR_PERFCTR_CORE		X86_CPU_PROPERTY(0x80000022, 0, EBX, 0, 3)
+#define X86_PROPERTY_NR_PERFCTR_NB		X86_CPU_PROPERTY(0x80000022, 0, EBX, 10, 15)
+
+#define X86_PROPERTY_MAX_CENTAUR_LEAF		X86_CPU_PROPERTY(0xC0000000, 0, EAX, 0, 31)
+
 static inline u32 __this_cpu_has(u32 function, u32 index, u8 reg, u8 lo, u8 hi)
 {
 	union {
@@ -347,6 +408,40 @@ static inline bool this_cpu_has(struct x86_cpu_feature feature)
 			      feature.reg, feature.bit, feature.bit);
 }
 
+static inline uint32_t this_cpu_property(struct x86_cpu_property property)
+{
+	return __this_cpu_has(property.function, property.index,
+			      property.reg, property.lo_bit, property.hi_bit);
+}
+
+static __always_inline bool this_cpu_has_p(struct x86_cpu_property property)
+{
+	uint32_t max_leaf;
+
+	switch (property.function & 0xc0000000) {
+	case 0:
+		max_leaf = this_cpu_property(X86_PROPERTY_MAX_BASIC_LEAF);
+		break;
+	case 0x40000000:
+		max_leaf = this_cpu_property(X86_PROPERTY_MAX_KVM_LEAF);
+		break;
+	case 0x80000000:
+		max_leaf = this_cpu_property(X86_PROPERTY_MAX_EXT_LEAF);
+		break;
+	case 0xc0000000:
+		max_leaf = this_cpu_property(X86_PROPERTY_MAX_CENTAUR_LEAF);
+	}
+	return max_leaf >= property.function;
+}
+
+static inline u8 cpuid_maxphyaddr(void)
+{
+	if (!this_cpu_has_p(X86_PROPERTY_MAX_PHY_ADDR))
+		return 36;
+
+	return this_cpu_property(X86_PROPERTY_MAX_PHY_ADDR);
+}
+
 struct far_pointer32 {
 	u32 offset;
 	u16 selector;
-- 
2.49.0.1204.g71687c7c1d-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
