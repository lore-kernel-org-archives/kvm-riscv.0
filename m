Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A5E6CCD199
	for <kvm-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 04:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cHUQ4w1gz0OmwQhs+LS7heuoTOA8wbHU9e33s8RLX/8=; b=kdhfwpXEDsAe5g
	lbKq29UkBh14vzpYEsLQx9KUpTrKn7m0STP3CKiA8Sh6HvP8u8f/Iv2/asn/gxkUGQLjpmU5Woe+6
	WLMQ0blLQOd/rNz02UB0EASNvHf+IUsFlIwTo0RI021KiPMSelGyVUXxbR2QY1alNyIfHg1QcWEGf
	dKOwOJ+eZThZVLyZmMysXaA4bCBKcPCSKYr4F+qhs75zBp0vhKH4dr6YmvCavCK/1vAcPZVNwpNuu
	70wWzrT1PJZPRlhT+mXoD+gKEreK32VWGgon/rleLu/elyx6AjIB2i+3Gege188LH+fxIP3eSoR5N
	gAMya/KQJXBY8nGMQRyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhSp-0000000Bqoy-41iA;
	Mon, 20 Oct 2025 04:25:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhSo-0000000Bqnn-2NsH
	for kvm-riscv@bombadil.infradead.org;
	Mon, 20 Oct 2025 04:25:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=3Dx3bjUZwp+FDi5HGHRvFmbVTrXXeKiS0FzRK/EiFHI=; b=DFSebGaPLjYfWWxb38xO7qXQU/
	T2+Z0IzamqP8FGuL4w53FPTmp7QcCodF/HxD2/AsnYlJE442VgrSFWNPpzkw2KCmuC5BUJcGKhS/5
	yhkq7mI2zmD+k314eWqEqVjfmMnTq9MIvJK1a9hCgbD0akYH1tJZrLIP217WrSBnhIt1gXVjOipPn
	I5unRu2M/uzzoJSchp09vuk02WZT2LdUOfLPShfmkvMr+PZnaTuTkAF4Q+9+tyuJGyRV7uIPa/uU2
	M4kQz8shWCB1qke3ob1gEWK9u//Ntit+kyYMoKfXNdSE5tVxHomvbmT23ebSX9hXGilrs0wjlEjO1
	eYDM8Deg==;
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhSk-00000009V8N-1XyI
	for kvm-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 04:25:41 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2698d47e776so29149515ad.1
        for <kvm-riscv@lists.infradead.org>; Sun, 19 Oct 2025 21:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1760934336; x=1761539136; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Dx3bjUZwp+FDi5HGHRvFmbVTrXXeKiS0FzRK/EiFHI=;
        b=k5BmlKSaCyWzCU8vYdnftSCQWmvm57YXICO4YHGrf4w4L4FkU9zA3HY07ED5AABKF2
         78gjOD0deyTVfwwP2GvpaNX7GdsAI+VKNcOoG8GRiCmSZmWhpHyMD0HPe4fN7cP4dy6z
         8P4PWIGrkS2aOIjdOyDw21QDRfLIEWL/0ZVq9112RtzSQniUwWUvAOZ2uveQdy4Q6kq0
         rPUBREIcbcVbtX0UD346aYgdCUXzaaWhhQJ/uFACDDUGHKAA+ob/kJ8uCgT3YALmPJK7
         TkJobVZy0x8ykwWl4awSVl4X2cCmu+dfJpxys851DSRjk5nfpKFeIYe3ibuY12vNLLt0
         IaIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760934336; x=1761539136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Dx3bjUZwp+FDi5HGHRvFmbVTrXXeKiS0FzRK/EiFHI=;
        b=oEAmabD7mwj7ee6fcvTsnDlBWqAHVqHI9B9BvC7iMfck1sduMueVWaW5orPnIxnC81
         DoCc7FovW48ExDwqWG3oCLihY4C9vwnC7/bXlt0CGSm8UJTdNgi1SGOmzJrm6RqNLOP6
         LhmKWcvZ8gLioOPYi4F5jB3zZN080CUL8psmobf56SW1sm0AD7pUSTT0gJPC2r0qqtOy
         ejGPY6eedbZb4/xyrIMunqMObNXEP4KrLaQR4OOHroPPDVqF0VGye0pC7epSuFVPB7jD
         GIE/3H59J55vPdxSDkURnlbL3DdzCqi+9WKI5XiowAjRKOuYvOP0uqdbMq+Mm/rdJw6I
         fLng==
X-Forwarded-Encrypted: i=1; AJvYcCVKkEvbulg7usr9AZv1zyFl1XWqxFrOzJFxKWgBZaDBeNAomS+26u7iXMSIbWVbiChYAa/3g4P8/n4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyuM4lqpTfmO12zK1hzmwRR4Jn9U5GRqtudpFwFxVlQ2mhfdJH5
	L4EI0z8UO7opYvYtYSJ5sCfket2uQAIyP4VI83S9Yl1zTpTAk46AykAiGxxFYevx1YU=
X-Gm-Gg: ASbGncuYZderKCk7oWM4DPbiwsNELD8qPKTzVNibOEYC7n0Lm3umO/DDz/CKzDqS3Sm
	b6/QDKCDOb6SiWWM8rWT4kTEz/7QdhVfg92WAt0hksB/cA4xWIcJ8AkEC8aTPmPfdErCH74u+8n
	t3fpngQtpucPiLJclp1+YYd5rQsYh/Cc3ElwVcztXe020cxx7xEfGzeFcsLXUJ5m81G0aLJ8z78
	ZEvXQok1Sle4MGAyigm4DhGDhIrJFZiXrFFpLi+Il19iYtoyLSJ/vFhKeU81e6OPtyNi35QtrOU
	i8osAQRXETkETRqCaxb1n/H8GMxwHVP9Z4x/KF3wjZF4W10V0i98Hde3CwxNswI3RsDQBwAsyne
	NQ4GiLBGCOTgdjdJvyC0jFq58LbVGCwWzJZntARCCe7GuX3SeUGSDxiYic3JjxX85Sm5YKoc+5X
	vn+n59F8xMnGHF+HrvZJCNB9LviAEiAkcy7SiaY/dkcjewg7EwupV/NXLj/MdQOBs=
X-Google-Smtp-Source: AGHT+IHd1kF3POpTVpfQwriGdz/AzJEchqY/kwdyjm7t3VNt+rro2wzxG/dmQOsLktQwlvjqL1Trmw==
X-Received: by 2002:a17:903:b48:b0:290:29ba:340f with SMTP id d9443c01a7336-290cb17c05fmr150708105ad.42.1760934336328;
        Sun, 19 Oct 2025 21:25:36 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246ec20a4sm68319325ad.7.2025.10.19.21.25.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 19 Oct 2025 21:25:36 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	will@kernel.org,
	peterz@infradead.org,
	boqun.feng@gmail.com,
	mark.rutland@arm.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pbonzini@redhat.com,
	shuah@kernel.org,
	parri.andrea@gmail.com,
	ajones@ventanamicro.com,
	brs@rivosinc.com,
	guoren@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com,
	lukas.bulwahn@gmail.com,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v4 08/10] riscv: Remove arch specific __atomic_acquire/release_fence
Date: Mon, 20 Oct 2025 12:24:55 +0800
Message-ID: <20251020042457.30915-4-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251020042457.30915-1-luxu.kernel@bytedance.com>
References: <20251020042457.30915-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_052538_998719_90C7020B 
X-CRM114-Status: UNSURE (   6.97  )
X-CRM114-Notice: Please train this message.
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

Remove arch specific __atomic_acquire/release_fence() operations since
they use fence instruction to simulate acquire/release order and can not
work well with real acquire/release instructions.

The default generic __atomic_acuire/release_fence() now provide sequential
order via 'fennce rw, rw'. They are rarely called since we use real
acquire/release instructions in most of times.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/atomic.h | 6 ------
 arch/riscv/include/asm/fence.h  | 4 ----
 2 files changed, 10 deletions(-)

diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
index 86291de07de62..6ed50a283bf8b 100644
--- a/arch/riscv/include/asm/atomic.h
+++ b/arch/riscv/include/asm/atomic.h
@@ -18,12 +18,6 @@
 
 #include <asm/cmpxchg.h>
 
-#define __atomic_acquire_fence()					\
-	__asm__ __volatile__(RISCV_ACQUIRE_BARRIER "" ::: "memory")
-
-#define __atomic_release_fence()					\
-	__asm__ __volatile__(RISCV_RELEASE_BARRIER "" ::: "memory");
-
 static __always_inline int arch_atomic_read(const atomic_t *v)
 {
 	return READ_ONCE(v->counter);
diff --git a/arch/riscv/include/asm/fence.h b/arch/riscv/include/asm/fence.h
index 182db7930edc2..9ce83e4793948 100644
--- a/arch/riscv/include/asm/fence.h
+++ b/arch/riscv/include/asm/fence.h
@@ -7,12 +7,8 @@
 	({ __asm__ __volatile__ (RISCV_FENCE_ASM(p, s) : : : "memory"); })
 
 #ifdef CONFIG_SMP
-#define RISCV_ACQUIRE_BARRIER		RISCV_FENCE_ASM(r, rw)
-#define RISCV_RELEASE_BARRIER		RISCV_FENCE_ASM(rw, w)
 #define RISCV_FULL_BARRIER		RISCV_FENCE_ASM(rw, rw)
 #else
-#define RISCV_ACQUIRE_BARRIER
-#define RISCV_RELEASE_BARRIER
 #define RISCV_FULL_BARRIER
 #endif
 
-- 
2.20.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
