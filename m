Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F72CCD199
	for <kvm-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 04:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7qRuFzdqmVHflKdrSBbqMm65kYK2oY5uA6GQb6RkJVU=; b=P2TrKfxpKaDKq6
	H31oRpD4XjMGk8eO99g8qSZ7IllQpKp9/O4WpKoQkwLyaFCFUpuzpL4LOLAkLGqOkc61twzwq7pUE
	susZsltKbNg65HOWzJgiiAom3wFgE5J8mw9+x5mSuDDZ5155INEot33IF/vbN5PVlXUoMVUv+g6+g
	dRimwsGUoAJBpzeJmHXpizBMXkS++DM6K9y5YGH0AQMeFfgFgdy2VxzFfkXYYmW+ai/YNZ6cJOemU
	COlR4YIkIDxfEb3K6auf6kGsg5U1heiR+yvD7Al9dsn0rXDzuxGME+ZDVi1RRxENcPYPO2G3XEOv0
	WOHNfs+ow++zuFKk/wRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhSd-0000000BqhT-2LOn;
	Mon, 20 Oct 2025 04:25:31 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhSa-0000000Bqfs-3w0Q
	for kvm-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 04:25:30 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-b609a32a9b6so2222463a12.2
        for <kvm-riscv@lists.infradead.org>; Sun, 19 Oct 2025 21:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1760934328; x=1761539128; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eAhCsGBB1TH5AMM7lpe2ReTjbDoEFVDwsghvbOsONac=;
        b=WouYpTLckgQ3FFRLDsdmVpFqtRGLp/7kFV76vS19j+dV58NC/zsZpp33m96QrF83B4
         W7yldaeSOjsyXkz433VtC6cgPAV41Mp0NRexuPpopv8yLG13mcdRtRWJ45SoND1rydFS
         6c07D4VIEZG31v8nk7krMGPvpu0zHvWs+ThB7TfAv/S+dYBMqTm45udAj7XHR7XoARUU
         wdyZ+Gce6ZOQKfC/mAC0i9k26Ojj4k1wHwUAhpJNs/OrCyiX8XiAZNXQBb7UygmgTnxF
         uS+8Wl+6KMAcF7SgFw7JMg4oijlJGclVOscq0aUOq/BIb93EoflDiOBq1GPHaPHk7XGS
         4tpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760934328; x=1761539128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eAhCsGBB1TH5AMM7lpe2ReTjbDoEFVDwsghvbOsONac=;
        b=hPUsS1yJklN7yhyN6K0EcyvJBYiRmRn1OrvEnuBFNlsg9sT3iY/HFB1HursqjXauT7
         FkClQT+mZGYtHPyj3yT7NOU4Nw8toXjwklW7FYxE1KwuzEk8vMpE88RORHSX0dQyFVGN
         yqOn5HWNrpFVuxlJanuMGezHEGhU9Xmu2XWqwM0BcmX40yCpqQhWjp6o9I7ixE7rjrnl
         nhZ6YSDhOg2crwrZ4gscD/7QcwzSt/63QvkFE3Ld2tNa2fpur953IMUvPCLTWBvlseco
         MbauUFSPC6cg8VsUPZZY23JJ2HpxzQGSLcqYIHjaP54g3ZJc7BKbUK0JRsvdPb9+6J+U
         Pehg==
X-Forwarded-Encrypted: i=1; AJvYcCWjrhk9G2YRQDmrxY2plS7DTWC1Fa2q4G3NIbLgH7DMZYt0ZThUmwEshqfkQw0CAoIHZOdjchW/sRg=@lists.infradead.org
X-Gm-Message-State: AOJu0YxmpYIY6wJ1h2RoR4NSST3kPnPACkLv8riJYmyOfMhXl+X6W9Io
	IQdMS2R7iFLmbTg8V0fUcNGceerFY9tWbFDl9JWQx2kMTBeNJfieuiJxxb46YUWJYjY=
X-Gm-Gg: ASbGnct1faiMlInvTtrGfKPdAe4cDDM5lpgW+xhTj21HpJBC/MTW8rPjipvOMFAipIw
	FuUZLhilc48Yg9kY+Ld6mjPFrrzgGcfRbV+khuvEQLxA0qZF18yAgHRx976mbMfkbHocU0iE/cp
	HPTtRD/Wi12r7/4snzTrkYJrCS7DkaI1al68bLJPG1XoalN881L6TuGaotD3WszNwXdA9oH71LK
	eWuM2KQypBiQ9w/Dbfdx6r8hkGrg9MR5wkr116KA4Ns4TmWZfuaxwPGn7M23puiJNb1+MTxLbYf
	WrVPDvENfz6xCvHsa+UZszUiAfXj5255whA67w8iPba28C6iBobZxBjPtFll0Oq2MiXFVH6caM8
	SC6hE/jsYRPl1zl0ZN0BblvfSG74ta6xX9rLR+RwzofA8r8UvOFT4jC4R3Lzc1Lk2XhL8a4LJog
	2UccTlzhougmb49IpLqIGQv8JloDxhB1ad1jYdcB+P/xaJQts6c9RU1+/o02OE1rg=
X-Google-Smtp-Source: AGHT+IFQr4LFijryTWzGKs84661TKpJBBbN75/B4QXkAS0iMqNHAgeauwTcUjRd7kZl/MznePhToLw==
X-Received: by 2002:a17:902:e552:b0:290:ac36:2ed8 with SMTP id d9443c01a7336-290c9ce63d6mr128754015ad.24.1760934328020;
        Sun, 19 Oct 2025 21:25:28 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246ec20a4sm68319325ad.7.2025.10.19.21.25.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 19 Oct 2025 21:25:27 -0700 (PDT)
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
Subject: [PATCH v4 07/10] riscv: Apply acquire/release semantics to arch_atomic operations
Date: Mon, 20 Oct 2025 12:24:54 +0800
Message-ID: <20251020042457.30915-3-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251020042457.30915-1-luxu.kernel@bytedance.com>
References: <20251020042457.30915-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_212529_101389_30E1EEF0 
X-CRM114-Status: UNSURE (   7.40  )
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

The existing arch_atomic operations are implemented by inserting fence
instrucitons before or after atomic instructions. This commit replaces
them with real acquire/release semantics.

|-----------------------------------------------|
|    | arch_atomic(64)_{add|sub}_return_release |
| rl |------------------------------------------|
|    |                amoadd.rl                 |
|-----------------------------------------------|
|    | arch_atomic(64)_{add|sub}_return_acquire |
| aq |------------------------------------------|
|    |                amoadd.aq                 |
|-----------------------------------------------|

|---------------------------------------------------------|
|    | arch_atomic(64)_fetch_{add|sub|and|or|xor}_release |
| rl |----------------------------------------------------|
|    |               amo{add|and|or|xor}.rl               |
|---------------------------------------------------------|
|    | arch_atomic(64)_fetch_{add|sub|and|or|xor}_acquire |
| aq |----------------------------------------------------|
|    |               amo{add|and|or|xor}.aq               |
|---------------------------------------------------------|

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/atomic.h | 64 +++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
index 5b96c2f61adb5..86291de07de62 100644
--- a/arch/riscv/include/asm/atomic.h
+++ b/arch/riscv/include/asm/atomic.h
@@ -98,6 +98,30 @@ c_type arch_atomic##prefix##_fetch_##op##_relaxed(c_type i,		\
 	return ret;							\
 }									\
 static __always_inline							\
+c_type arch_atomic##prefix##_fetch_##op##_acquire(c_type i,		\
+						  atomic##prefix##_t *v)	\
+{									\
+	register c_type ret;						\
+	__asm__ __volatile__ (						\
+		"	amo" #asm_op "." #asm_type ".aq %1, %2, %0"	\
+		: "+A" (v->counter), "=r" (ret)				\
+		: "r" (I)						\
+		: "memory");						\
+	return ret;							\
+}									\
+static __always_inline							\
+c_type arch_atomic##prefix##_fetch_##op##_release(c_type i,		\
+						  atomic##prefix##_t *v)	\
+{									\
+	register c_type ret;						\
+	__asm__ __volatile__ (						\
+		"	amo" #asm_op "." #asm_type ".rl %1, %2, %0"	\
+		: "+A" (v->counter), "=r" (ret)				\
+		: "r" (I)						\
+		: "memory");						\
+	return ret;							\
+}									\
+static __always_inline							\
 c_type arch_atomic##prefix##_fetch_##op(c_type i, atomic##prefix##_t *v)	\
 {									\
 	register c_type ret;						\
@@ -117,6 +141,18 @@ c_type arch_atomic##prefix##_##op##_return_relaxed(c_type i,		\
         return arch_atomic##prefix##_fetch_##op##_relaxed(i, v) c_op I;	\
 }									\
 static __always_inline							\
+c_type arch_atomic##prefix##_##op##_return_acquire(c_type i,		\
+						   atomic##prefix##_t *v)	\
+{									\
+	return arch_atomic##prefix##_fetch_##op##_acquire(i, v) c_op I;	\
+}									\
+static __always_inline							\
+c_type arch_atomic##prefix##_##op##_return_release(c_type i,		\
+						   atomic##prefix##_t *v)	\
+{									\
+	return arch_atomic##prefix##_fetch_##op##_release(i, v) c_op I;	\
+}									\
+static __always_inline							\
 c_type arch_atomic##prefix##_##op##_return(c_type i, atomic##prefix##_t *v)	\
 {									\
         return arch_atomic##prefix##_fetch_##op(i, v) c_op I;		\
@@ -139,22 +175,38 @@ ATOMIC_OPS(sub, add, +, -i)
 
 #define arch_atomic_add_return_relaxed	arch_atomic_add_return_relaxed
 #define arch_atomic_sub_return_relaxed	arch_atomic_sub_return_relaxed
+#define arch_atomic_add_return_acquire	arch_atomic_add_return_acquire
+#define arch_atomic_sub_return_acquire	arch_atomic_sub_return_acquire
+#define arch_atomic_add_return_release	arch_atomic_add_return_release
+#define arch_atomic_sub_return_release	arch_atomic_sub_return_release
 #define arch_atomic_add_return		arch_atomic_add_return
 #define arch_atomic_sub_return		arch_atomic_sub_return
 
 #define arch_atomic_fetch_add_relaxed	arch_atomic_fetch_add_relaxed
 #define arch_atomic_fetch_sub_relaxed	arch_atomic_fetch_sub_relaxed
+#define arch_atomic_fetch_add_acquire	arch_atomic_fetch_add_acquire
+#define arch_atomic_fetch_sub_acquire	arch_atomic_fetch_sub_acquire
+#define arch_atomic_fetch_add_release	arch_atomic_fetch_add_release
+#define arch_atomic_fetch_sub_release	arch_atomic_fetch_sub_release
 #define arch_atomic_fetch_add		arch_atomic_fetch_add
 #define arch_atomic_fetch_sub		arch_atomic_fetch_sub
 
 #ifndef CONFIG_GENERIC_ATOMIC64
 #define arch_atomic64_add_return_relaxed	arch_atomic64_add_return_relaxed
 #define arch_atomic64_sub_return_relaxed	arch_atomic64_sub_return_relaxed
+#define arch_atomic64_add_return_acquire	arch_atomic64_add_return_acquire
+#define arch_atomic64_sub_return_acquire	arch_atomic64_sub_return_acquire
+#define arch_atomic64_add_return_release	arch_atomic64_add_return_release
+#define arch_atomic64_sub_return_release	arch_atomic64_sub_return_release
 #define arch_atomic64_add_return		arch_atomic64_add_return
 #define arch_atomic64_sub_return		arch_atomic64_sub_return
 
 #define arch_atomic64_fetch_add_relaxed	arch_atomic64_fetch_add_relaxed
 #define arch_atomic64_fetch_sub_relaxed	arch_atomic64_fetch_sub_relaxed
+#define arch_atomic64_fetch_add_acquire	arch_atomic64_fetch_add_acquire
+#define arch_atomic64_fetch_sub_acquire	arch_atomic64_fetch_sub_acquire
+#define arch_atomic64_fetch_add_release	arch_atomic64_fetch_add_release
+#define arch_atomic64_fetch_sub_release	arch_atomic64_fetch_sub_release
 #define arch_atomic64_fetch_add		arch_atomic64_fetch_add
 #define arch_atomic64_fetch_sub		arch_atomic64_fetch_sub
 #endif
@@ -177,6 +229,12 @@ ATOMIC_OPS(xor, xor, i)
 #define arch_atomic_fetch_and_relaxed	arch_atomic_fetch_and_relaxed
 #define arch_atomic_fetch_or_relaxed	arch_atomic_fetch_or_relaxed
 #define arch_atomic_fetch_xor_relaxed	arch_atomic_fetch_xor_relaxed
+#define arch_atomic_fetch_and_acquire	arch_atomic_fetch_and_acquire
+#define arch_atomic_fetch_or_acquire	arch_atomic_fetch_or_acquire
+#define arch_atomic_fetch_xor_acquire	arch_atomic_fetch_xor_acquire
+#define arch_atomic_fetch_and_release	arch_atomic_fetch_and_release
+#define arch_atomic_fetch_or_release	arch_atomic_fetch_or_release
+#define arch_atomic_fetch_xor_release	arch_atomic_fetch_xor_release
 #define arch_atomic_fetch_and		arch_atomic_fetch_and
 #define arch_atomic_fetch_or		arch_atomic_fetch_or
 #define arch_atomic_fetch_xor		arch_atomic_fetch_xor
@@ -185,6 +243,12 @@ ATOMIC_OPS(xor, xor, i)
 #define arch_atomic64_fetch_and_relaxed	arch_atomic64_fetch_and_relaxed
 #define arch_atomic64_fetch_or_relaxed	arch_atomic64_fetch_or_relaxed
 #define arch_atomic64_fetch_xor_relaxed	arch_atomic64_fetch_xor_relaxed
+#define arch_atomic64_fetch_and_acquire	arch_atomic64_fetch_and_acquire
+#define arch_atomic64_fetch_or_acquire	arch_atomic64_fetch_or_acquire
+#define arch_atomic64_fetch_xor_acquire	arch_atomic64_fetch_xor_acquire
+#define arch_atomic64_fetch_and_release	arch_atomic64_fetch_and_release
+#define arch_atomic64_fetch_or_release	arch_atomic64_fetch_or_release
+#define arch_atomic64_fetch_xor_release	arch_atomic64_fetch_xor_release
 #define arch_atomic64_fetch_and		arch_atomic64_fetch_and
 #define arch_atomic64_fetch_or		arch_atomic64_fetch_or
 #define arch_atomic64_fetch_xor		arch_atomic64_fetch_xor
-- 
2.20.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
