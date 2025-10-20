Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5542ACCD193
	for <kvm-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 04:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Altgxm84U9qNrKnxZvsRzGaJmp4/2OqzgsOr2M2C0gQ=; b=raJhUNf9jPOFws
	2PonKI+2ERnzP94FN3f7xjP5+anVqCg+oykVli5NbIubYSmOsA11WH/4ew4MX9teEtj3dSEjCEPEz
	5hFqeyTxz/joo2EwdFekP1qeWYa1FqBh6kwXk0R8DtMW3qNn3xJabGwyL4E1h9q+qwFQaARAmRpGj
	+a7Dodv1tXLofa70CJ0CxjquFtVF7QWoRlRoQnwshCBunVOjhaK1tVsXeNG7e0bN9iymxkSMUo0I4
	TXHmwE/sTRGRP8JxMq1HSA6W458xD7gB1NUgMgfTdMHueVcfret9qxy5FOJGmz65rE27+NiQM8EXq
	5uD1okKEUYCYnPgLJlnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhSe-0000000Bqi9-0RNI;
	Mon, 20 Oct 2025 04:25:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhSc-0000000BqgZ-3qyf
	for kvm-riscv@bombadil.infradead.org;
	Mon, 20 Oct 2025 04:25:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=obq5zFRUbQnhz/6ak4c69JinsROwXC9HaOuW/JUDMF4=; b=b8Bud6cCNPP5WE70ObLYmmnZmL
	VsJT17TYUhxd95SBkYm0u4p7J/T9WEVWVw5BJKE4Y79YEJyy+3YqN2imyz7Lmv6B3Bv8rYCGEWDSE
	gK5UZ0RkZKXN+EIptvpgOyMybKHpf4+6fnAY+B5xCxusR67h915cI4wvGKKx+uGif1SKFB75derjz
	XJj8b7FF+LwIM3Lej1jc5YbfUQu/oY0yZVCBg4iUdj4UhRRUB5WFBS87xULJtqlTeyKY8GBFv/H3L
	xlCUd+3C71MaLLrweRWsrqxToKf9oF6Xk+QUilT7XFI8ryWAtVcxHDtVagmbTXMl61Y2L1ko5jr2H
	eS2BKirg==;
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhSY-00000009V57-1Yhd
	for kvm-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 04:25:29 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b63148d25c3so2402042a12.1
        for <kvm-riscv@lists.infradead.org>; Sun, 19 Oct 2025 21:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1760934319; x=1761539119; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=obq5zFRUbQnhz/6ak4c69JinsROwXC9HaOuW/JUDMF4=;
        b=c078spSjSa5UIAPmhaFDaYLJRp90OMzoNnF5m6jUIgeUaRG+LrwJ5MRlEbjWhqaMsi
         Kc/eKUk18RQq6eaHiTBojqAdu/c7FSu5fe6hZRRkAWwpTWZLDEcP3OaMOKlfMJccVv+M
         CYElVMsnq2TCyOcfK2wI5+MV5mXSsGVskuoWVMkzVljYzbxck+PeCc6ThwnBH8+tYtFV
         Ke/Ewfi4o6tz72qUfXrrKp4EsWsxy63Zj1ch0AgxFx5Qe9mjSlpMA91+PL6Z3DNr0yTD
         9apT5cgxHi0Xfrh7JssuSf1oCwLtRtjOWo9BCU26sf7vQm8cGNC6JgvGPr2+1d1RW/BL
         dSxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760934319; x=1761539119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=obq5zFRUbQnhz/6ak4c69JinsROwXC9HaOuW/JUDMF4=;
        b=H4/1DZCauZH9u7bhtGsucATfLCOFgGmBy0bUPIe9RI92W/yepaWu8KkjJseLGbigUW
         bd7ILsTNf+waKrwG2Gdpe0G1WI4fu80RJoSBmI/z8kzKVeapt/yTbQHgIeo9Gf1UVaLt
         k5oXsGsTw9u1VXH3Nidk5CabNQwRoghqoDHOrSQ0c9g4O/8qmUaEl/JGuFEp8O8d7oWN
         18g2E31IEZIbi/RyNbi0To+q2KMMdxHsdxyYFs2THncZGne/mHvsHCuAtfRIDOhLYoMv
         nc/Gp2WS9tadKVm2QGaLY/+th7HgF0yo+/vK/Z5RmuMTrWjHKrsWpsL5SyieYpxCsEM/
         3flA==
X-Forwarded-Encrypted: i=1; AJvYcCWiV/ocaWVSgH6HOtsuF+IhBWHAou77Zj9BzxjaFxuBuqVuuviBMVRJgchU9UobKpG/P3vzJXjuuqQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+PWZxl+3V0FPAbgqWZ+L/Wk352OoL5jRAtOA8+/6k+AtAaOrI
	x4v3jKTBvOJ6pOwt2rIW2fNggdlRmkjl6IImcuh+PonovGdm4dRW4VsEVz9IR/shVkpf9uukB2F
	rRVJdV2A=
X-Gm-Gg: ASbGncv5911Q2pMaquG1Ne8oKKhgcvpud5ToPjyDTBwQA9+Vit2JOZXw36bswmVa1Vm
	fduu0w9n0Y9SKwiEJ6QedlYwrZLxh8xZI52pctIVeX16RXzbEaFGeOg4VCABM9g+M6adL+sY5q6
	iRdYzknK7X0jG+5GZOd+MjqeWuWxLn5Ek45+Z5YliCxWaub8HUPADLqDmgeZYGM/y0YZ4sCstRl
	UKy7AlVpkUrpVV9dk+QPAEu6VzcTUzZesixkfRIC0dyENfb11TvXs88dRV2SYJ0nUnmKpLqKvF5
	eOaV8Xe8ueBe3Uw2UaRrd1wXqrRMyEJrPcCo3IpM5v9mOvbOiZAr4XM05RSxmhjvakBxiwnzSj1
	EhGV6dvB640PoRIlERkJxU5PdAoqy4aOJKDadXICf0dj36ULCUiPU3n2hMgfjS2H5HNjFohUEzL
	E0jAALH2wzsoHbvLjiipK1f9KX59nTVaN1QbKwH2Zkr9O6dCCYRUtUSieEQsHb1Tc=
X-Google-Smtp-Source: AGHT+IEADekY+PfDTkxIlwwqUSm0jpa89LPAxAIlo9A2MiPlx5+tEh4i22tMIEWZw3GrGyhmHRxBRA==
X-Received: by 2002:a17:903:19e7:b0:267:cdc1:83e with SMTP id d9443c01a7336-29091b586d2mr204859535ad.15.1760934319501;
        Sun, 19 Oct 2025 21:25:19 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246ec20a4sm68319325ad.7.2025.10.19.21.25.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 19 Oct 2025 21:25:19 -0700 (PDT)
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
Subject: [PATCH v4 06/10] riscv: Apply acquire/release semantics to arch_xchg/arch_cmpxchg operations
Date: Mon, 20 Oct 2025 12:24:53 +0800
Message-ID: <20251020042457.30915-2-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251020042457.30915-1-luxu.kernel@bytedance.com>
References: <20251020042457.30915-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_052526_739233_D96D4F95 
X-CRM114-Status: GOOD (  10.86  )
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

The existing arch_xchg/arch_cmpxchg operations are implemented by
inserting fence instructions before or after atomic instructions.
This commit replaces them with real acquire/release semantics.

|----------------------------------------------------------------|
|    |    arch_xchg_release       |     arch_cmpxchg_release     |
|    |-----------------------------------------------------------|
|    | zabha      | !zabha        | zabha+zacas | !(zabha+zacas) |
| rl |-----------------------------------------------------------|
|    |            | (fence rw, w) |             | (fence rw, w)  |
|    | amoswap.rl | lr.w          | amocas.rl   | lr.w           |
|    |            | sc.w.rl       |             | sc.w.rl        |
|----------------------------------------------------------------|
|    |    arch_xchg_acquire       |     arch_cmpxchg_acquire     |
|    |-----------------------------------------------------------|
|    | zabha      | !zabha        | zabha+zacas | !(zabha+zacas) |
| aq |-----------------------------------------------------------|
|    |            | lr.w.aq       |             | lr.w.aq        |
|    | amoswap.aq | sc.w          | amocas.aq   | sc.w           |
|    |            | (fence r, rw) |             | (fence r, rw)  |
|----------------------------------------------------------------|

(fence rw, w), (fence r, rw) here means such instructions will only
be inserted when zalasr is not implemented.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/cmpxchg.h | 144 +++++++++++++++----------------
 1 file changed, 71 insertions(+), 73 deletions(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 0b749e7102162..50fd46af448a9 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -15,15 +15,31 @@
 #include <asm/cpufeature-macros.h>
 #include <asm/processor.h>
 
-#define __arch_xchg_masked(sc_sfx, swap_sfx, prepend, sc_append,		\
-			   swap_append, r, p, n)				\
+/*
+ * These macros are here to improve the readability of the arch_xchg_XXX()
+ * and arch_cmpxchg_XXX() macros.
+ */
+#define LR_SFX(x)		x
+#define SC_SFX(x)		x
+#define CAS_SFX(x)		x
+#define SC_PREPEND(x)		x
+#define SC_APPEND(x)		x
+
+#ifdef CONFIG_SMP
+#define SC_ACQUIRE_BARRIER	RISCV_FENCE_ASM(r, rw)
+#define SC_RELEASE_BARRIER	RISCV_FENCE_ASM(rw, w)
+#else
+#define SC_ACQUIRE_BARRIER	__nops(1)
+#define SC_RELEASE_BARRIER	__nops(1)
+#endif
+
+#define __arch_xchg_masked(lr_sfx, sc_sfx, swap_sfx, sc_prepend, sc_append,	\
+			   r, p, n)						\
 ({										\
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&				\
 	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZABHA)) {		\
 		__asm__ __volatile__ (						\
-			prepend							\
 			"	amoswap" swap_sfx " %0, %z2, %1\n"		\
-			swap_append						\
 			: "=&r" (r), "+A" (*(p))				\
 			: "rJ" (n)						\
 			: "memory");						\
@@ -37,14 +53,16 @@
 		ulong __rc;							\
 										\
 		__asm__ __volatile__ (						\
-		       prepend							\
 		       PREFETCHW_ASM(%5)					\
+		       ALTERNATIVE(__nops(1), sc_prepend,			\
+				   0, RISCV_ISA_EXT_ZALASR, 1)			\
 		       "0:	lr.w %0, %2\n"					\
 		       "	and  %1, %0, %z4\n"				\
 		       "	or   %1, %1, %z3\n"				\
 		       "	sc.w" sc_sfx " %1, %1, %2\n"			\
 		       "	bnez %1, 0b\n"					\
-		       sc_append						\
+		       ALTERNATIVE(__nops(1), sc_append,			\
+				   0, RISCV_ISA_EXT_ZALASR, 1)			\
 		       : "=&r" (__retx), "=&r" (__rc), "+A" (*(__ptr32b))	\
 		       : "rJ" (__newx), "rJ" (~__mask), "rJ" (__ptr32b)		\
 		       : "memory");						\
@@ -53,19 +71,17 @@
 	}									\
 })
 
-#define __arch_xchg(sfx, prepend, append, r, p, n)			\
+#define __arch_xchg(sfx, r, p, n)					\
 ({									\
 	__asm__ __volatile__ (						\
-		prepend							\
 		"	amoswap" sfx " %0, %2, %1\n"			\
-		append							\
 		: "=r" (r), "+A" (*(p))					\
 		: "r" (n)						\
 		: "memory");						\
 })
 
-#define _arch_xchg(ptr, new, sc_sfx, swap_sfx, prepend,			\
-		   sc_append, swap_append)				\
+#define _arch_xchg(ptr, new, lr_sfx, sc_sfx, swap_sfx,			\
+		   sc_prepend, sc_append)				\
 ({									\
 	__typeof__(ptr) __ptr = (ptr);					\
 	__typeof__(*(__ptr)) __new = (new);				\
@@ -73,22 +89,20 @@
 									\
 	switch (sizeof(*__ptr)) {					\
 	case 1:								\
-		__arch_xchg_masked(sc_sfx, ".b" swap_sfx,		\
-				   prepend, sc_append, swap_append,	\
+		__arch_xchg_masked(lr_sfx, sc_sfx, ".b" swap_sfx,	\
+				   sc_prepend, sc_append,		\
 				   __ret, __ptr, __new);		\
 		break;							\
 	case 2:								\
-		__arch_xchg_masked(sc_sfx, ".h" swap_sfx,		\
-				   prepend, sc_append, swap_append,	\
+		__arch_xchg_masked(lr_sfx, sc_sfx, ".h" swap_sfx,	\
+				   sc_prepend, sc_append,		\
 				   __ret, __ptr, __new);		\
 		break;							\
 	case 4:								\
-		__arch_xchg(".w" swap_sfx, prepend, swap_append,	\
-			      __ret, __ptr, __new);			\
+		__arch_xchg(".w" swap_sfx, __ret, __ptr, __new);	\
 		break;							\
 	case 8:								\
-		__arch_xchg(".d" swap_sfx, prepend, swap_append,	\
-			      __ret, __ptr, __new);			\
+		__arch_xchg(".d" swap_sfx, __ret, __ptr, __new);	\
 		break;							\
 	default:							\
 		BUILD_BUG();						\
@@ -97,17 +111,23 @@
 })
 
 #define arch_xchg_relaxed(ptr, x)					\
-	_arch_xchg(ptr, x, "", "", "", "", "")
+	_arch_xchg(ptr, x, LR_SFX(""), SC_SFX(""), CAS_SFX(""),		\
+		   SC_PREPEND(__nops(1)), SC_APPEND(__nops(1)))
 
 #define arch_xchg_acquire(ptr, x)					\
-	_arch_xchg(ptr, x, "", "", "",					\
-		   RISCV_ACQUIRE_BARRIER, RISCV_ACQUIRE_BARRIER)
+	_arch_xchg(ptr, x, LR_SFX(".aq"), SC_SFX(""), CAS_SFX(".aq"),	\
+		   SC_PREPEND(__nops(1)),				\
+		   SC_APPEND(SC_ACQUIRE_BARRIER))
 
 #define arch_xchg_release(ptr, x)					\
-	_arch_xchg(ptr, x, "", "", RISCV_RELEASE_BARRIER, "", "")
+	_arch_xchg(ptr, x, LR_SFX(""), SC_SFX(".rl"), CAS_SFX(".rl"),	\
+		   SC_PREPEND(SC_RELEASE_BARRIER),			\
+		   SC_APPEND(__nops(1)))
 
 #define arch_xchg(ptr, x)						\
-	_arch_xchg(ptr, x, ".rl", ".aqrl", "", RISCV_FULL_BARRIER, "")
+	_arch_xchg(ptr, x, LR_SFX(""), SC_SFX(".aqrl"),			\
+		   CAS_SFX(".aqrl"), SC_PREPEND(__nops(1)),		\
+		   SC_APPEND(__nops(1)))
 
 #define xchg32(ptr, x)							\
 ({									\
@@ -126,9 +146,7 @@
  * store NEW in MEM.  Return the initial value in MEM.  Success is
  * indicated by comparing RETURN with OLD.
  */
-#define __arch_cmpxchg_masked(sc_sfx, cas_sfx,					\
-			      sc_prepend, sc_append,				\
-			      cas_prepend, cas_append,				\
+#define __arch_cmpxchg_masked(lr_sfx, sc_sfx, cas_sfx, sc_prepend, sc_append,	\
 			      r, p, o, n)					\
 ({										\
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&				\
@@ -138,9 +156,7 @@
 		r = o;								\
 										\
 		__asm__ __volatile__ (						\
-			cas_prepend							\
 			"	amocas" cas_sfx " %0, %z2, %1\n"		\
-			cas_append							\
 			: "+&r" (r), "+A" (*(p))				\
 			: "rJ" (n)						\
 			: "memory");						\
@@ -155,15 +171,17 @@
 		ulong __rc;							\
 										\
 		__asm__ __volatile__ (						\
-			sc_prepend							\
-			"0:	lr.w %0, %2\n"					\
+			ALTERNATIVE(__nops(1), sc_prepend,			\
+				    0, RISCV_ISA_EXT_ZALASR, 1)			\
+			"0:	lr.w" lr_sfx " %0, %2\n"			\
 			"	and  %1, %0, %z5\n"				\
 			"	bne  %1, %z3, 1f\n"				\
 			"	and  %1, %0, %z6\n"				\
 			"	or   %1, %1, %z4\n"				\
 			"	sc.w" sc_sfx " %1, %1, %2\n"			\
 			"	bnez %1, 0b\n"					\
-			sc_append							\
+			ALTERNATIVE(__nops(1), sc_append,			\
+				    0, RISCV_ISA_EXT_ZALASR, 1)			\
 			"1:\n"							\
 			: "=&r" (__retx), "=&r" (__rc), "+A" (*(__ptr32b))	\
 			: "rJ" ((long)__oldx), "rJ" (__newx),			\
@@ -174,9 +192,7 @@
 	}									\
 })
 
-#define __arch_cmpxchg(lr_sfx, sc_sfx, cas_sfx,				\
-		       sc_prepend, sc_append,				\
-		       cas_prepend, cas_append,				\
+#define __arch_cmpxchg(lr_sfx, sc_sfx, cas_sfx,	sc_prepend, sc_append,	\
 		       r, p, co, o, n)					\
 ({									\
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) &&			\
@@ -184,9 +200,7 @@
 		r = o;							\
 									\
 		__asm__ __volatile__ (					\
-			cas_prepend					\
 			"	amocas" cas_sfx " %0, %z2, %1\n"	\
-			cas_append					\
 			: "+&r" (r), "+A" (*(p))			\
 			: "rJ" (n)					\
 			: "memory");					\
@@ -194,12 +208,14 @@
 		register unsigned int __rc;				\
 									\
 		__asm__ __volatile__ (					\
-			sc_prepend					\
+			ALTERNATIVE(__nops(1), sc_prepend,		\
+				    0, RISCV_ISA_EXT_ZALASR, 1)		\
 			"0:	lr" lr_sfx " %0, %2\n"			\
 			"	bne  %0, %z3, 1f\n"			\
 			"	sc" sc_sfx " %1, %z4, %2\n"		\
 			"	bnez %1, 0b\n"				\
-			sc_append					\
+			ALTERNATIVE(__nops(1), sc_append,		\
+				    0, RISCV_ISA_EXT_ZALASR, 1)		\
 			"1:\n"						\
 			: "=&r" (r), "=&r" (__rc), "+A" (*(p))		\
 			: "rJ" (co o), "rJ" (n)				\
@@ -207,9 +223,8 @@
 	}								\
 })
 
-#define _arch_cmpxchg(ptr, old, new, sc_sfx, cas_sfx,			\
-		      sc_prepend, sc_append,				\
-		      cas_prepend, cas_append)				\
+#define _arch_cmpxchg(ptr, old, new, lr_sfx, sc_sfx, cas_sfx,		\
+		      sc_prepend, sc_append)				\
 ({									\
 	__typeof__(ptr) __ptr = (ptr);					\
 	__typeof__(*(__ptr)) __old = (old);				\
@@ -218,27 +233,23 @@
 									\
 	switch (sizeof(*__ptr)) {					\
 	case 1:								\
-		__arch_cmpxchg_masked(sc_sfx, ".b" cas_sfx,		\
+		__arch_cmpxchg_masked(lr_sfx, sc_sfx, ".b" cas_sfx,	\
 				      sc_prepend, sc_append,		\
-				      cas_prepend, cas_append,		\
 				      __ret, __ptr, __old, __new);	\
 		break;							\
 	case 2:								\
-		__arch_cmpxchg_masked(sc_sfx, ".h" cas_sfx,		\
+		__arch_cmpxchg_masked(lr_sfx, sc_sfx, ".h" cas_sfx,	\
 				      sc_prepend, sc_append,		\
-				      cas_prepend, cas_append,		\
 				      __ret, __ptr, __old, __new);	\
 		break;							\
 	case 4:								\
-		__arch_cmpxchg(".w", ".w" sc_sfx, ".w" cas_sfx,		\
+		__arch_cmpxchg(".w" lr_sfx, ".w" sc_sfx, ".w" cas_sfx,	\
 			       sc_prepend, sc_append,			\
-			       cas_prepend, cas_append,			\
 			       __ret, __ptr, (long)(int)(long), __old, __new);	\
 		break;							\
 	case 8:								\
-		__arch_cmpxchg(".d", ".d" sc_sfx, ".d" cas_sfx,		\
+		__arch_cmpxchg(".d" lr_sfx, ".d" sc_sfx, ".d" cas_sfx,	\
 			       sc_prepend, sc_append,			\
-			       cas_prepend, cas_append,			\
 			       __ret, __ptr, /**/, __old, __new);	\
 		break;							\
 	default:							\
@@ -247,40 +258,27 @@
 	(__typeof__(*(__ptr)))__ret;					\
 })
 
-/*
- * These macros are here to improve the readability of the arch_cmpxchg_XXX()
- * macros.
- */
-#define SC_SFX(x)	x
-#define CAS_SFX(x)	x
-#define SC_PREPEND(x)	x
-#define SC_APPEND(x)	x
-#define CAS_PREPEND(x)	x
-#define CAS_APPEND(x)	x
-
 #define arch_cmpxchg_relaxed(ptr, o, n)					\
 	_arch_cmpxchg((ptr), (o), (n),					\
-		      SC_SFX(""), CAS_SFX(""),				\
-		      SC_PREPEND(""), SC_APPEND(""),			\
-		      CAS_PREPEND(""), CAS_APPEND(""))
+		      LR_SFX(""), SC_SFX(""), CAS_SFX(""),		\
+		      SC_PREPEND(__nops(1)), SC_APPEND(__nops(1)))
 
 #define arch_cmpxchg_acquire(ptr, o, n)					\
 	_arch_cmpxchg((ptr), (o), (n),					\
-		      SC_SFX(""), CAS_SFX(""),				\
-		      SC_PREPEND(""), SC_APPEND(RISCV_ACQUIRE_BARRIER),	\
-		      CAS_PREPEND(""), CAS_APPEND(RISCV_ACQUIRE_BARRIER))
+		      LR_SFX(".aq"), SC_SFX(""), CAS_SFX(".aq"),	\
+		      SC_PREPEND(__nops(1)),				\
+		      SC_APPEND(SC_ACQUIRE_BARRIER))
 
 #define arch_cmpxchg_release(ptr, o, n)					\
 	_arch_cmpxchg((ptr), (o), (n),					\
-		      SC_SFX(""), CAS_SFX(""),				\
-		      SC_PREPEND(RISCV_RELEASE_BARRIER), SC_APPEND(""),	\
-		      CAS_PREPEND(RISCV_RELEASE_BARRIER), CAS_APPEND(""))
+		      LR_SFX(""), SC_SFX(".rl"), CAS_SFX(".rl"),	\
+		      SC_PREPEND(SC_RELEASE_BARRIER),			\
+		      SC_APPEND(__nops(1)))
 
 #define arch_cmpxchg(ptr, o, n)						\
 	_arch_cmpxchg((ptr), (o), (n),					\
-		      SC_SFX(".rl"), CAS_SFX(".aqrl"),			\
-		      SC_PREPEND(""), SC_APPEND(RISCV_FULL_BARRIER),	\
-		      CAS_PREPEND(""), CAS_APPEND(""))
+		      LR_SFX(""), SC_SFX(".aqrl"), CAS_SFX(".aqrl"),	\
+		      SC_PREPEND(__nops(1)), SC_APPEND(__nops(1)))
 
 #define arch_cmpxchg_local(ptr, o, n)					\
 	arch_cmpxchg_relaxed((ptr), (o), (n))
-- 
2.20.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
