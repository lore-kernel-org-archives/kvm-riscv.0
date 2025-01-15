Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD527C02180
	for <kvm-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 18:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WcBnWSk/hyH8SwojJvlzv4vV60K1jOMpn+jClkfQIOI=; b=FzMuOAHNk1cUeq
	cOMw3Xz+EtQ0iTNz2kdcsxfmRrYLGeluxa8opMRNZ4dHJPMRpYbkZakZ3FMGbYWxBQMx00TOQAsS+
	eLGkeUqqjagQ+CvgdJI8oN4EzsCJ5Tll5+wlauvsNuJti5BeBVONHeA/1RNzsHT5uAHgPdgjgwnY6
	1bt7aJJ0WJA9LU5F4omlICalomP7gt+9FrnRnpZUzvT1JXiHgtdmbjy2BHVb0vXU2clBACYqPepHh
	9v1SRiEnX/Kdsf7ej5NXnEuK0rL61kyPKu0HJrXMv0AHpAx+hjRVgBcilmVGCW3I9H33l72CA61dM
	hUn3aEveL2gDzUiSS9hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8KS-0000000CnkH-1shI;
	Wed, 15 Jan 2025 18:41:24 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8AS-0000000ClH4-3AXu
	for kvm-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 18:31:06 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-21661be2c2dso127640025ad.1
        for <kvm-riscv@lists.infradead.org>; Wed, 15 Jan 2025 10:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736965864; x=1737570664; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eGsO74qlfZsPi9kGTe6Mf3rItgKav5O5SJKk6N7d7+Y=;
        b=wNmOjhd1c8hCYRFvTLrna97YGhT9ZZAOG9Av9zRxwpiu6Unr3OYYvk7kgbGC+hAdp/
         GrvmTNyKZXJbgr29wwUY0JRCC+aKkfTiRTVTJabJ5pJstVILrgiGLFmT8e1Z/rzFzisx
         2ztUoReBM3w/siIa5m5aY2EGzQB5hjVb5W92S2MuenA32N+e//A2GVQOkVDxpQcjWS8u
         vH7ktemggKWeyprK0JOsznelI9C7DhhW28nHfqPlCQTuoAKTJEwymbiYeSQebgdaCCQI
         /ddR+T/xVjY3nYYgoPOUZRS/FvlajgYy689Mb1QX9pG5f0jjMS48b2hgk2f1lC0jpSEg
         E5Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736965864; x=1737570664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eGsO74qlfZsPi9kGTe6Mf3rItgKav5O5SJKk6N7d7+Y=;
        b=RpZtxzpaSUJdFkh5QKwP7IriLwamaQqJ1pEKI8WERscSLeuTp/UX2dBustv1uy7V/n
         yNX+2nmMvK9qsS/tacFs2iIY5A0fMeXOALFY8lQqWptLiWJ+ShvfKmR8cnlGO0N1tULe
         c2k/J4vst8ySqfVM6iGaFFnhRYsglI9adO9cvcIcU+5N4Gfjc1FFpfwir3OkbQ6ZRElg
         39sfUSdlxkT5BAeHOi72O7b+R9liYnMHhVNr162rHbBeL9ZOJVFcD92uueGKxw8THRqb
         wCA5NKxbq6UmGYgXvhLPdKV+u7KIBf/2Romr08SA42bZ+mSjoUyG1HTJwCvj1r5bUI15
         lMuw==
X-Forwarded-Encrypted: i=1; AJvYcCXJ8PNG+se75BcSVLgQm8ZkkOCmu82CGF/4V77oLUsPPfd5OuEkp3LV67XQ9uBHVWqnDA81slkNW30=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5Gf8KJO7LUc9/opZAdJiUcKN+JlQAnbg8mK5dt+FnF+gomSIT
	KKzw7N0gTBG51MQf8MhCan+blvX4uY3XmLAKGRST2bipJc7lv7kYU79O3HKSlfc=
X-Gm-Gg: ASbGnctOakRGbKK0+soFbUw/q1xPnZF/9ekTEeJGFE294BHetPtaDND19s+Or4XACkR
	B6nhbtsUp+PKge34m+XR4qQfueQEj6QIe4S2KROtOlZJawyNXZqvGMkAxkUMqoKzAqolupS6lSL
	4wsVe0WoUR8oyXEh6Cz0KYhqdoxJ6fw5NCE9tGJ/6hQRQXn1ijKBMhZJhZ2kssNkS2QnTdITB9p
	wRXZQgyoDvsA3DWGZABy/IoDiVXMSOL9Iw6Y67g5Vn73+gXMDQfNNDc4G8Ze70Z7M5iRg==
X-Google-Smtp-Source: AGHT+IEVuy0zAtOEk7axH9BqkY46Q1CUJK/CsgMJYOIS0qmHtHOLlyWCGQnQHM7bf0KJ01YfA5xjlQ==
X-Received: by 2002:a17:902:cccb:b0:216:6769:9eca with SMTP id d9443c01a7336-21a83fd35bdmr452990815ad.37.1736965862343;
        Wed, 15 Jan 2025 10:31:02 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f219f0dsm85333195ad.139.2025.01.15.10.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 10:31:02 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 15 Jan 2025 10:30:46 -0800
Subject: [PATCH v2 6/9] KVM: Add a helper function to validate vcpu gpa
 range
MIME-Version: 1.0
Message-Id: <20250115-pmu_event_info-v2-6-84815b70383b@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250115_103104_811801_7A5B8E44 
X-CRM114-Status: GOOD (  12.55  )
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
index 401439bb21e3..d999f80c7148 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1363,6 +1363,8 @@ static inline int kvm_vcpu_map_readonly(struct kvm_vcpu *vcpu, gpa_t gpa,
 
 unsigned long kvm_vcpu_gfn_to_hva(struct kvm_vcpu *vcpu, gfn_t gfn);
 unsigned long kvm_vcpu_gfn_to_hva_prot(struct kvm_vcpu *vcpu, gfn_t gfn, bool *writable);
+int kvm_vcpu_validate_gpa_range(struct kvm_vcpu *vcpu, gpa_t gpa, unsigned long len,
+				bool write_access);
 int kvm_vcpu_read_guest_page(struct kvm_vcpu *vcpu, gfn_t gfn, void *data, int offset,
 			     int len);
 int kvm_vcpu_read_guest_atomic(struct kvm_vcpu *vcpu, gpa_t gpa, void *data,
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index de2c11dae231..b81522add27e 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3283,6 +3283,27 @@ int kvm_vcpu_write_guest(struct kvm_vcpu *vcpu, gpa_t gpa, const void *data,
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
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
