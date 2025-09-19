Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A4C9CAC592
	for <kvm-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 07:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RLZTzxMAbxpjq9G9t/R1jl+V72xIFIaHTNOzYPq42Pw=; b=BwmGW47tNanMTr
	axn/HjQfZcZOyNOS1qqYFHlGQsXWunqbb51K5bPbp7AL65Q3njch4rQ/mbWRhNO6Bzi4SH+2ea3wD
	GT5daFDtbrdY4EGh3QmTC7XZSXtGCHJb44skVIdxrQUsQM6PckBmZRPt2b6JekEFn4G0tsY0A4rAy
	5eKsDxqMHwecfCQ42CMj0t4VH5AI2/7UP4ktlzk1JTqS+iuEiHGIwo6NS8F8ypAQo7eIOk0s/5aem
	cb97VKC9WTjQolrine3sqhT9LPkr9VsbQ6WMiA9h592gXCIV34rOC/MX14QdSLCS25vsBfT+hj+wt
	AIDdoVaJQXRhvtR9H+sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVh7-000000025aG-43Qw;
	Fri, 19 Sep 2025 07:38:13 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVh5-000000025YP-1Etn
	for kvm-riscv@lists.infradead.org;
	Fri, 19 Sep 2025 07:38:12 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7762021c574so1794979b3a.0
        for <kvm-riscv@lists.infradead.org>; Fri, 19 Sep 2025 00:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758267491; x=1758872291; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+193yncmANzEfIfweyuJi14B+CiP/3dMuVzUWsZjMz4=;
        b=kiQ4IPARFhf2e5jP774y9g3jQTa0WE17KUhI6LvJwZuw+HkxNFt2PhoDa7bpRWED6i
         6eoRVwLCUjZbmf/D3I3cdIMkiDKfjahJUKAM8g0ZfzdKsoHJAqceNJV/cQXL68+6W7IB
         3ZuxvGXf/yC7OlnMqFq67TSc4S1riAGs9ndCjsnNjlONuU8NCsFJ4GeytF7HOVBC8Thx
         LgXmOTZLIIqsF9Slgz4CuYd0Ecbxy2GPUBe6b9fZv64gPUIRdwXUP+/xM+SizjDJufs2
         EZ+z4xQS9kGXUfnxa0X81S5luU/ClOIZy2DnLs8FwjlRnajo31zA+8+jYdYRcmc3MWV7
         C7zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758267491; x=1758872291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+193yncmANzEfIfweyuJi14B+CiP/3dMuVzUWsZjMz4=;
        b=p8CYksBroWh22mUSOkj92gMz8C4ZyE5m4j8R+n0q80fLvz/yoohgeFy00uC/Wg54Es
         +PqyRz4lzPZBVz05KuqPyPaHF0cMZuQdI44F2k8FRFKm8ROC2oZ/XEsR29JY9nrBwnIu
         Qx0hR1FaOSZ8121NhwT4rLqsAFH9/8z59cLRVv8zO0tt7cjoVnrY/bCqTOIZInQ8ZzAz
         /MNH+j0gUE3+XgYtBQmijsr8iS8hggwtxVTOa6SBnHP60NUh2Fb29VgGq9tc9SMfSQUP
         XsqP7KMqo2h1sL0jZz/KCqWC5STq5poZBJij5bWcFUIgcEZOZRSw0+t8nUG3Aa50d126
         mTig==
X-Forwarded-Encrypted: i=1; AJvYcCVqNfAZAhAruF4bT+HhDbrkznIdKWXo4/MXCuzW36Lt6YPnEyqbmQtlSsZX0u2s/o8XN61scvWUcvs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yypro9brSnLudxSlga9LP1VMdLyoMajvqC1w45Nk9v8jJFhj3N4
	/lmOnincxNAQbb7kt+SO/fELBFRP4Hv7BMARjAipo0MOdKmfrvNv+N78IQP7vIPR8+g=
X-Gm-Gg: ASbGnctkCzwoXDLCkq/oA/DwQghCxOYCkJ+dYBaVIb33p7rvocOMYx411yvUGZM0Xvi
	szpYEZNkyquZtY6M2pra/+MT0/EOR8TKvHvS51SWNvHlYWJIW7/UNwl6Yux2YgxsOOtgEJwebrg
	ZuuMKC0bOUTh2YMxpKMM64+fyDiEiwxAaxEhWC49EPQzvUFSdDK0OO8+Vr9Oezznc2OD/cWeLiQ
	kC+CNQWZYL1FmfzfvuVH5xXFi6TawdFv/INI7tx5WT/u6bkrCpQbOPTIkj/QD395+0nqvQ3kv+D
	tdKBYXZz35GPb7HO+72JDA6uoB0jzsR4usVSYQ96R+6y7bHFjQ8pR/yHG+uHDVNPXQSzOgID2Da
	7z3uhC9yTnnGFTT6t8PTQrTRrqR+OkTSmCX6GfmgOxbPzcYA1KGVKzgrTj9gZRovVf2ZiML2Z63
	Vb4aRAzD53Vwr5NcVjsx8VvRfjzxxy0Hi9H5oZqp0ryQ==
X-Google-Smtp-Source: AGHT+IHSeUWZ1h2FvilomFO6LKlK35LvsEHQvldORE6E3obR4YCYcFLQha/I1fqdofri+zuG0ncN0g==
X-Received: by 2002:a17:902:cccc:b0:24d:a3a0:5230 with SMTP id d9443c01a7336-269ba54c1c4mr31455485ad.58.1758267490633;
        Fri, 19 Sep 2025 00:38:10 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.57])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b550fd7ebc7sm2679096a12.19.2025.09.19.00.38.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Sep 2025 00:38:10 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: corbet@lwn.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	will@kernel.org,
	peterz@infradead.org,
	boqun.feng@gmail.com,
	mark.rutland@arm.com,
	parri.andrea@gmail.com,
	ajones@ventanamicro.com,
	brs@rivosinc.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pbonzini@redhat.com,
	shuah@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v3 4/8] riscv: Introduce Zalasr instructions
Date: Fri, 19 Sep 2025 15:37:10 +0800
Message-ID: <20250919073714.83063-5-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250919073714.83063-1-luxu.kernel@bytedance.com>
References: <20250919073714.83063-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_003811_352011_06180C7F 
X-CRM114-Status: UNSURE (   7.01  )
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

Introduce l{b|h|w|d}.{aq|aqrl} and s{b|h|w|d}.{rl|aqrl} instruction
encodings.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/insn-def.h | 79 +++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
index d5adbaec1d010..3fec7e66ce50f 100644
--- a/arch/riscv/include/asm/insn-def.h
+++ b/arch/riscv/include/asm/insn-def.h
@@ -179,6 +179,7 @@
 #define RV___RS1(v)		__RV_REG(v)
 #define RV___RS2(v)		__RV_REG(v)
 
+#define RV_OPCODE_AMO		RV_OPCODE(47)
 #define RV_OPCODE_MISC_MEM	RV_OPCODE(15)
 #define RV_OPCODE_OP_IMM	RV_OPCODE(19)
 #define RV_OPCODE_SYSTEM	RV_OPCODE(115)
@@ -208,6 +209,84 @@
 	__ASM_STR(.error "hlv.d requires 64-bit support")
 #endif
 
+#define LB_AQ(dest, addr)					\
+	INSN_R(OPCODE_AMO, FUNC3(0), FUNC7(26),			\
+	       RD(dest), RS1(addr), __RS2(0))
+
+#define LB_AQRL(dest, addr)					\
+	INSN_R(OPCODE_AMO, FUNC3(0), FUNC7(27),			\
+	       RD(dest), RS1(addr), __RS2(0))
+
+#define LH_AQ(dest, addr)					\
+	INSN_R(OPCODE_AMO, FUNC3(1), FUNC7(26),			\
+	       RD(dest), RS1(addr), __RS2(0))
+
+#define LH_AQRL(dest, addr)					\
+	INSN_R(OPCODE_AMO, FUNC3(1), FUNC7(27),			\
+	       RD(dest), RS1(addr), __RS2(0))
+
+#define LW_AQ(dest, addr)					\
+	INSN_R(OPCODE_AMO, FUNC3(2), FUNC7(26),			\
+	       RD(dest), RS1(addr), __RS2(0))
+
+#define LW_AQRL(dest, addr)					\
+	INSN_R(OPCODE_AMO, FUNC3(2), FUNC7(27),			\
+	       RD(dest), RS1(addr), __RS2(0))
+
+#define SB_RL(src, addr)					\
+	INSN_R(OPCODE_AMO, FUNC3(0), FUNC7(29),			\
+	       __RD(0), RS1(addr), RS2(src))
+
+#define SB_AQRL(src, addr)					\
+	INSN_R(OPCODE_AMO, FUNC3(0), FUNC7(31),			\
+	       __RD(0), RS1(addr), RS2(src))
+
+#define SH_RL(src, addr)					\
+	INSN_R(OPCODE_AMO, FUNC3(1), FUNC7(29),			\
+	       __RD(0), RS1(addr), RS2(src))
+
+#define SH_AQRL(src, addr)					\
+	INSN_R(OPCODE_AMO, FUNC3(1), FUNC7(31),			\
+	       __RD(0), RS1(addr), RS2(src))
+
+#define SW_RL(src, addr)					\
+	INSN_R(OPCODE_AMO, FUNC3(2), FUNC7(29),			\
+	       __RD(0), RS1(addr), RS2(src))
+
+#define SW_AQRL(src, addr)					\
+	INSN_R(OPCODE_AMO, FUNC3(2), FUNC7(31),			\
+	       __RD(0), RS1(addr), RS2(src))
+
+#ifdef CONFIG_64BIT
+#define LD_AQ(dest, addr)					\
+	INSN_R(OPCODE_AMO, FUNC3(3), FUNC7(26),			\
+	       RD(dest), RS1(addr), __RS2(0))
+
+#define LD_AQRL(dest, addr)					\
+	INSN_R(OPCODE_AMO, FUNC3(3), FUNC7(27),			\
+	       RD(dest), RS1(addr), __RS2(0))
+
+#define SD_RL(src, addr)					\
+	INSN_R(OPCODE_AMO, FUNC3(3), FUNC7(29),			\
+	       __RD(0), RS1(addr), RS2(src))
+
+#define SD_AQRL(src, addr)					\
+	INSN_R(OPCODE_AMO, FUNC3(3), FUNC7(31),			\
+	       __RD(0), RS1(addr), RS2(src))
+#else
+#define LD_AQ(dest, addr)					\
+	__ASM_STR(.error "ld.aq requires 64-bit support")
+
+#define LD_AQRL(dest, addr)					\
+	__ASM_STR(.error "ld.aqrl requires 64-bit support")
+
+#define SD_RL(dest, addr)					\
+	__ASM_STR(.error "sd.rl requires 64-bit support")
+
+#define SD_AQRL(dest, addr)					\
+	__ASM_STR(.error "sd.aqrl requires 64-bit support")
+#endif
+
 #define SINVAL_VMA(vaddr, asid)					\
 	INSN_R(OPCODE_SYSTEM, FUNC3(0), FUNC7(11),		\
 	       __RD(0), RS1(vaddr), RS2(asid))
-- 
2.20.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
