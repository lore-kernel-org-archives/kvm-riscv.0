Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36590CCD199
	for <kvm-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 04:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kE2DEgSjcwlPIRO/aIBGL6Tp7pGETfWjUTdcPFluiwY=; b=GOh0Dm5iMRA9L8
	ECPJ7IMR49jeP5F+qhzR0bHLG0Wn2O8QAjT8QAZ5YRdYE9NrsQFHzRO84bfq2nEI/glD1wvyZEBw6
	obrriO6U+CiU8oD2JKG3dc6z1EFJRZuFh4aBTmz0k9vNxhPF3I0qCebq3+tWm0SEy/2J4Fu/UYql8
	u7Ri0/gjxMehlmaiUqN17DZAJnvO9H6+m6L6u8YSEnvlRX8BTsTHTq09eDpxK3RCCFegx3c4xDtB3
	B3r5dvOOrNsLnN7kP6juQPGyuXzH//mL0k+C0ZH2/Uqb7RTEuUp9A0Uuwn+CQKFY57Opwo/pw0Nj2
	wQeTrD105ul19vI4IwwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhSN-0000000BqaL-3Ofv;
	Mon, 20 Oct 2025 04:25:15 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhSJ-0000000BqZ3-3blJ
	for kvm-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 04:25:13 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-290deb0e643so25010965ad.2
        for <kvm-riscv@lists.infradead.org>; Sun, 19 Oct 2025 21:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1760934311; x=1761539111; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qPcskIG/1ay0sXA6LTmEjesE/nyn+okHLSoMKeTK/t4=;
        b=bRPkNhITh8CUQl6K2Ymf+hjH8o+O2MFOgVMUIV0RFRYxyD7dmkoXKed/sFLJbNGd8n
         hXx5+pa3OUlH0zAyeIUn3MFOCz5nQz6HurgeCKxOrIo6eUYkUgQX4c3A3878JEu9sDSd
         UFXbiH0fEoIfsklScE2IZQ7W3VjJIPvW/nAb5g/c1LEKZvHTDyhnQFYK+Uh0xSOBGJkG
         XP1NtiBS8z986OFkBH+V27HlVYsKqT460U5GjTkLSn7TOwpeOE/6B56k+/nxHe00jl5j
         1tZIK7uyJgYJT6xVHzN6dz0D8z5nzlSrstSuWvrzaXNfiuvrnxcMJPGFqKUZaYHNPfk9
         GkVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760934311; x=1761539111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qPcskIG/1ay0sXA6LTmEjesE/nyn+okHLSoMKeTK/t4=;
        b=vTMU6P9Cp+LEXsUrmomgMARxF/MNMrXMcSGtP442EDWJdd90OiRP+zt4456zNxzK71
         PC80d3ACaq9TE9rGrmfee3SC0m1BQJHZuSZL8NmhnHDYzXwY9h/WgOmKOQ7rMuBESBlK
         lH46FZ8yTt7DgGkFUEPd2l4YoS8rnyUq17XmnexohPZ/Hsv9vIz3aXoAJssIATEaR6DI
         4peJe3obTd5jMUp444rCtBi6/C/8l1YF7u13Cc+tFZe5X7bLUWmwW5U7cyFlAbofop7d
         OXl+5J4pRsF+B/gZl4UgCHXiEFStMJ05yMYa42/eUxQPtiLfsz389YXHzX97ogDM1Lyx
         1s7g==
X-Forwarded-Encrypted: i=1; AJvYcCWYMDHl1zLPjTqXuwTilKOBybBPM57D8Du5cIzF7SD343xdTv8J2u1J4PyIVwPH0mkfD8f/S2rZQa8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzDhrJD4b2VnPGZYeiNx5YQWxsCrqI2MGIFK1DsqQRQK+9mP0Qv
	6IkUKKfWP3FKP028FlAGvGJ02KbffEp28HQnQYodYUT8bg0LzbMdYJqPF+c+Ijbq3ng=
X-Gm-Gg: ASbGncu9eNE6l+3QOlulLxMigFBofIDm6KPuC4H2GFMSibStl/tplDFAtQx9Ycd9y1n
	MZ8UDUYKkNK6fopeMAAcOi/tNcqy47D8ul/JMi3CD5jEo+UDtYTFfCnbP3q+xVCMszsAv2EQPi0
	YXGzDqhRnpZxH55wkoUl2ngJ7WHhOPh/ZYo8MV0zLseSVhx3rlBri+XLDLssb/qkVwObgJj5qWs
	AbIWuRoZveozJGgA1xl8KFwQFXCJoCSxpYv3mLC5HiiM47SS+jBwwLSiWzCDFp8Z//klS5So+0z
	fqZLTmwqY4YafwMyEG/MEGDjnVFgUeFh8A7Ca0byDwLWNYIG5SAB+UsvmnZJ3x39MC2s0OG6kAa
	Hj6bfoiXn2e3J5tbvmZrISjgKk9LnGHcG0VgPZikJcjGIa3iO8vdP0lKh9xIvQsL3P355w78oTi
	e8K9fTx+Ai+MJQQZCVOd98XprHLdmY7GvlwLW+jcZ7qSC+qPjaPFsx61IAZRSMDBUaebeo6PaQW
	fr1DlNhMcKN
X-Google-Smtp-Source: AGHT+IEujhnClojcicPbj3y6ytDrc6WWv+RwekLkEKlFozxNxVRIRtmsdedEqStzjhfQZMJDA0LXfw==
X-Received: by 2002:a17:902:f647:b0:24b:11c8:2d05 with SMTP id d9443c01a7336-290cb65c5b1mr125810595ad.45.1760934311032;
        Sun, 19 Oct 2025 21:25:11 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246ec20a4sm68319325ad.7.2025.10.19.21.25.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 19 Oct 2025 21:25:10 -0700 (PDT)
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
Subject: [PATCH v4 05/10] riscv: Apply Zalasr to smp_load_acquire/smp_store_release
Date: Mon, 20 Oct 2025 12:24:52 +0800
Message-ID: <20251020042457.30915-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_212511_904081_B39E0D12 
X-CRM114-Status: UNSURE (   7.35  )
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

Replace fence instructions with Zalasr instructions during
smp_load_acquire() and smp_store_release() operations.

|----------------------------------|
|    |     __smp_store_release     |
|    |-----------------------------|
|    | zalasr        | !zalasr     |
| rl |-----------------------------|
|    | s{b|h|w|d}.rl | fence rw, w |
|    |               | s{b|h|w|d}  |
|----------------------------------|
|    |    __smp_load_acquire       |
|    |-----------------------------|
|    | zalasr        | !zalasr     |
| aq |-----------------------------|
|    | l{b|h|w|d}.aq | l{b|h|w|d}  |
|    |               | fence r, rw |
|----------------------------------|

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/barrier.h | 91 ++++++++++++++++++++++++++++----
 1 file changed, 80 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/include/asm/barrier.h b/arch/riscv/include/asm/barrier.h
index b8c5726d86acb..9eaf94a028096 100644
--- a/arch/riscv/include/asm/barrier.h
+++ b/arch/riscv/include/asm/barrier.h
@@ -51,19 +51,88 @@
  */
 #define smp_mb__after_spinlock()	RISCV_FENCE(iorw, iorw)
 
-#define __smp_store_release(p, v)					\
-do {									\
-	compiletime_assert_atomic_type(*p);				\
-	RISCV_FENCE(rw, w);						\
-	WRITE_ONCE(*p, v);						\
+extern void __bad_size_call_parameter(void);
+
+#define __smp_store_release(p, v)						\
+do {										\
+	typeof(p) __p = (p);							\
+	union { typeof(*p) __val; char __c[1]; } __u =				\
+		{ .__val = (__force typeof(*p)) (v) };				\
+	compiletime_assert_atomic_type(*p);					\
+	switch (sizeof(*p)) {							\
+	case 1:									\
+		asm volatile(ALTERNATIVE("fence rw, w;\t\nsb %0, 0(%1)\t\n",	\
+					 SB_RL(%0, %1) "\t\nnop\t\n",		\
+					 0, RISCV_ISA_EXT_ZALASR, 1)		\
+					 : : "r" (*(__u8 *)__u.__c), "r" (__p)	\
+					 : "memory");				\
+		break;								\
+	case 2:									\
+		asm volatile(ALTERNATIVE("fence rw, w;\t\nsh %0, 0(%1)\t\n",	\
+					 SH_RL(%0, %1) "\t\nnop\t\n",		\
+					 0, RISCV_ISA_EXT_ZALASR, 1)		\
+					 : : "r" (*(__u16 *)__u.__c), "r" (__p)	\
+					 : "memory");				\
+		break;								\
+	case 4:									\
+		asm volatile(ALTERNATIVE("fence rw, w;\t\nsw %0, 0(%1)\t\n",	\
+					 SW_RL(%0, %1) "\t\nnop\t\n",		\
+					 0, RISCV_ISA_EXT_ZALASR, 1)		\
+					 : : "r" (*(__u32 *)__u.__c), "r" (__p)	\
+					 : "memory");				\
+		break;								\
+	case 8:									\
+		asm volatile(ALTERNATIVE("fence rw, w;\t\nsd %0, 0(%1)\t\n",	\
+					 SD_RL(%0, %1) "\t\nnop\t\n",		\
+					 0, RISCV_ISA_EXT_ZALASR, 1)		\
+					 : : "r" (*(__u64 *)__u.__c), "r" (__p)	\
+					 : "memory");				\
+		break;								\
+	default:								\
+		__bad_size_call_parameter();					\
+		break;								\
+	}									\
 } while (0)
 
-#define __smp_load_acquire(p)						\
-({									\
-	typeof(*p) ___p1 = READ_ONCE(*p);				\
-	compiletime_assert_atomic_type(*p);				\
-	RISCV_FENCE(r, rw);						\
-	___p1;								\
+#define __smp_load_acquire(p)							\
+({										\
+	union { typeof(*p) __val; char __c[1]; } __u;				\
+	typeof(p) __p = (p);							\
+	compiletime_assert_atomic_type(*p);					\
+	switch (sizeof(*p)) {							\
+	case 1:									\
+		asm volatile(ALTERNATIVE("lb %0, 0(%1)\t\nfence r, rw\t\n",	\
+					 LB_AQ(%0, %1) "\t\nnop\t\n",		\
+					 0, RISCV_ISA_EXT_ZALASR, 1)		\
+					 : "=r" (*(__u8 *)__u.__c) : "r" (__p)	\
+					 : "memory");				\
+		break;								\
+	case 2:									\
+		asm volatile(ALTERNATIVE("lh %0, 0(%1)\t\nfence r, rw\t\n",	\
+					 LH_AQ(%0, %1) "\t\nnop\t\n",		\
+					 0, RISCV_ISA_EXT_ZALASR, 1)		\
+					 : "=r" (*(__u16 *)__u.__c) : "r" (__p)	\
+					 : "memory");				\
+		break;								\
+	case 4:									\
+		asm volatile(ALTERNATIVE("lw %0, 0(%1)\t\nfence r, rw\t\n",	\
+					 LW_AQ(%0, %1) "\t\nnop\t\n",		\
+					 0, RISCV_ISA_EXT_ZALASR, 1)		\
+					 : "=r" (*(__u32 *)__u.__c) : "r" (__p)	\
+					 : "memory");				\
+		break;								\
+	case 8:									\
+		asm volatile(ALTERNATIVE("ld %0, 0(%1)\t\nfence r, rw\t\n",	\
+					 LD_AQ(%0, %1) "\t\nnop\t\n",		\
+					 0, RISCV_ISA_EXT_ZALASR, 1)		\
+					 : "=r" (*(__u64 *)__u.__c) : "r" (__p)	\
+					 : "memory");				\
+		break;								\
+	default:								\
+		__bad_size_call_parameter();					\
+		break;								\
+	}									\
+	__u.__val;								\
 })
 
 #ifdef CONFIG_RISCV_ISA_ZAWRS
-- 
2.20.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
