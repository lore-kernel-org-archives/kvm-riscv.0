Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C73A1CA1002
	for <kvm-riscv@archiver.kernel.org>; Fri, 29 Aug 2025 18:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cpkmY6f64vZ3m7/xmjkx5kLNHa5r6AJf2mdjk5VqV7Y=; b=kCby5tCxCFBAga
	mEDJyZWqCJwaXShF81BflOC289qdmANW+WmQlmA9Yubf+yj2eoyPCd//61OWd4yt7hZymrTzELvAH
	xpeYjRwqJtwOpsgc1t79Tf/O6uWORFyfJD7+mK/7YV4mmNd3cG8tEmzbEBrDTm0q51np7ljhGqikG
	aNT7EfedTB3BEU9GojQe1Cc5dnr2GPQkWmv5yQYbzeeYvwHmPGSG/Zb3iAYkRBY1mrc5UbiudvGZD
	Y5eyWJ+YE8PU/KGvEcMqse2En3lmrQyVW3dOEa/JQYoHbvvrN0pD0XqfcSsirt+dbbqf/RxSy2iTM
	ahLvNAeeug4YwICuyaDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us4Ak-00000006flj-23th;
	Fri, 29 Aug 2025 18:50:02 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us0Hz-0000000645V-0vze
	for kvm-riscv@lists.infradead.org;
	Fri, 29 Aug 2025 14:41:16 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-771fa8e4190so1549267b3a.1
        for <kvm-riscv@lists.infradead.org>; Fri, 29 Aug 2025 07:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1756478475; x=1757083275; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pJrFx3WCqf6VFVoWT85m6XL4XoNDn8hAld/4UFHpYgs=;
        b=OFePEh0V3xPkBy1hgGqrfYg+fPI+dVQpm0zAj7zJD450mFlrBtXL4Eiw4IMVU6A4Hc
         lh1q0jr1vytc+8/fmVSb04r6OLuXJv4opNrsRj2Id87Cy2eOVOXlvL+8zhEQsBNyw4kk
         afeL/xrwPL2gqz9DHfRkDILC03+IiTySSM3Y55C9uMRFZ4opjlqXzRknX1MhNKtvWd7G
         u2pM7KdQYh5LmSCQJxJmlfAexXXqLlSLLOwrqfxTrOWQ/XuYyI/rkKMk6urZ5B5XhAap
         hKhMJ1b+LyJ1LkE9oHjx6l/WMdNDe1wNE/rA8TmqIYnwkOq4Rn0yZpfut8fcOjh0gtrg
         nLKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756478475; x=1757083275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pJrFx3WCqf6VFVoWT85m6XL4XoNDn8hAld/4UFHpYgs=;
        b=fmgbF+TgSs0iQVzkLQWTcKscHXjJZwCNQVFIx7s/7tyfj8tFscUN29G5RzD3g9Y8j9
         AbjLUZEIGqgcvlSGUYUjRaoxi0WoRDlCwQ0vjPHsYU1MOktevht8W0E+l78vZYb6FmHl
         D1NFZAmISUvfVAsRyPHnvgP6WeElLA3h56Gx/pXK8gJ/jcw3VgR66lnz7Akg1cIT5YGR
         EaHnYuD1GDbGDkZxcSzOBpNTxLHHzLvMbsJlcQri5V/PufEbki/3xTQphf+fGMRXz/6w
         KQUZIWIwwJpEPwul5zIyf7OZ50FeWIMO7Gcg+oQd0pFX1OEyUVY8gn2ua8vPE3fIlRx/
         8j5w==
X-Forwarded-Encrypted: i=1; AJvYcCXWspzMmZHMzDtonxfZJMMiG3Fpa62pn0Tz73MtJJ0YFDw85Xs1qw9VLmFdjCG1XQ7Cqyt28E/ron4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4g65T0ptVCdQiXp84L3TXZ4m2GLfwTwOGfkW671mOlk2Zt+wq
	QO0vvcqiNwqh6zcLRA0E5xfIT9spwpSFj/HIcPV93vYBz+RWwFDLH12LnMHBrtktOpg=
X-Gm-Gg: ASbGncslyC1r9MNOgPkwmZbRBUC/8E5bCaMNi2eFCcNta9daVunBcLVhEUEp0a0M4K+
	sh4Nh/Mp8pkJk1GhmD5KpMzbyh+rQNfvaWAKPdYNLVE8W0Ck1vLeL26v2R9ulWaBmZO/NpFlKc7
	AatT1ggGtAUKlO8KxF+YY0zaDXQmXS5NQebNhD3C6g+LlvPH4yURA94wUs974UY+cYzdmmLEBhk
	XOvAQZcj5qWNin8hJn2J+6BXiCUnQxZVdn4g+B/51JRG4RIZmKWBct0VzJTxYXMicOXfxsddNZx
	mctXtdRJOyLy9idWHbLzm/qoD5Yuwgage2DTH7iWrzEeGmww2dJt7ZINu3OWZTxhqVIgHVj6u8Q
	gs3Jv7NJBAI/5pkU6VxCLLWWeR6HmJhupYnA6+Hwgw+v0wg==
X-Google-Smtp-Source: AGHT+IE+tippTw8I5Rjqj8J4MuD+XFXMLrYSoKCBTNLNIx4D19MX2vzDRgyVPUrBIKEMjW6IJPF1lQ==
X-Received: by 2002:a05:6a20:c127:b0:243:b8c8:a247 with SMTP id adf61e73a8af0-243b8c8a5b5mr5669681637.2.1756478474637;
        Fri, 29 Aug 2025 07:41:14 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4e1f86sm2560999b3a.72.2025.08.29.07.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 07:41:14 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Fri, 29 Aug 2025 07:41:07 -0700
Subject: [PATCH v5 6/9] KVM: Add a helper function to check if a gpa is in
 writable memselot
MIME-Version: 1.0
Message-Id: <20250829-pmu_event_info-v5-6-9dca26139a33@rivosinc.com>
References: <20250829-pmu_event_info-v5-0-9dca26139a33@rivosinc.com>
In-Reply-To: <20250829-pmu_event_info-v5-0-9dca26139a33@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250829_074115_269412_CF69D42A 
X-CRM114-Status: GOOD (  10.64  )
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

The arch specific code may need to know if a particular gpa is valid and
writable for the shared memory between the host and the guest. Currently,
there are few places where it is used in RISC-V implementation. Given the
nature of the function it may be used for other architectures.
Hence, a common helper function is added.

Suggested-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 include/linux/kvm_host.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 15656b7fba6c..eec5cbbcb4b3 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1892,6 +1892,14 @@ static inline bool kvm_is_gpa_in_memslot(struct kvm *kvm, gpa_t gpa)
 	return !kvm_is_error_hva(hva);
 }
 
+static inline bool kvm_is_gpa_in_writable_memslot(struct kvm *kvm, gpa_t gpa)
+{
+	bool writable;
+	unsigned long hva = gfn_to_hva_prot(kvm, gpa_to_gfn(gpa), &writable);
+
+	return !kvm_is_error_hva(hva) && writable;
+}
+
 static inline void kvm_gpc_mark_dirty_in_slot(struct gfn_to_pfn_cache *gpc)
 {
 	lockdep_assert_held(&gpc->lock);

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
