Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 714ADCCD199
	for <kvm-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 04:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BX84ZV/GR6IpG3bmxi95ShoBo/51REUC+dqF27Rcv0g=; b=GhWaYJnLMwbzMY
	2tiWEofI/LJYzBEWt6uB1NBiI7CifAo+yJ1ULZRRf4w5ygExWP32/CxHMgjYqsfMx2R5EN3BhrGeQ
	91b6FrihqSKnQcfuepi+BCWh9E152jaWFam0fh/0MCK2mjl4M/3htX9ujj/kJfOZ9PCHnkFUa3TxB
	PPidjYGVFCZgYx5XRUNuCI0dqtJMWAC5WMO689aQ1NYzCqxyejHeeRA/dmaPyIwg4zTYD5kHDU2qb
	JfCBAR27t635fjnFfTt4D9tLXTkcNpF7mfmSPd0GFEOyKblfkiYEFgqTAP7gmNv6CHdzXQMm+7pQt
	HLr2NbV8s5ENdRBw6cMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhOu-0000000BpsD-0aYx;
	Mon, 20 Oct 2025 04:21:40 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhOr-0000000BppT-00uf
	for kvm-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 04:21:39 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b679450ecb6so2879417a12.2
        for <kvm-riscv@lists.infradead.org>; Sun, 19 Oct 2025 21:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1760934096; x=1761538896; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TLsLBJWdfVYa2JlLG/bj2PxPL4kYEdygRJ5GLCZsFlo=;
        b=iEipUyS5mpy3kIBp2nWh3cbhHRPEw3mWs9lXvBXuGSdOhP6/pCfVn83OwVc9iqQ3Vu
         p0H7+V6r1LObGveARkWAuuIh+GQ07ARR/PLMFk/wI8JXLyn/gal//V+PqRcf0l5A3t4u
         +Z3/tP5Z5Lb3CIdZqTBR0yYvyMJqfWqXVbV9iw10VChqUDkrMu66EpD++0ErEFx6Gw56
         Xa6NOZICPUFC5r5LlMbGONNc5eUiokEpL96207zmBJ3zb8vBvfY7huXLaUhhDHdlAvtv
         PHbzhlGIGDSZJHp0LMrkC5515IT4kzg91F3ZTcExLuRijStSdaUMab0USWa4wERB7CDZ
         k3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760934096; x=1761538896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TLsLBJWdfVYa2JlLG/bj2PxPL4kYEdygRJ5GLCZsFlo=;
        b=K/oQC1y/3Hl10pcMt3CfeVH1fxZCSg6JJ+4P+rwrAr300C4ZmZlOk/qpjcQ/8Gz1fh
         nKgfSXlqLEJyERxuDMNN3nQCqq8vW3xEPV7G0G2ZX3ALWqbm2bMFsNj+hxJ2FyFCCX3p
         T05QiGaowA9Doj9YGYxhKxHS+gAU8fbaFjdV6IGmNO1mleDICjkDuhSvT6vCk8/+PKeT
         tvPMsf/WK4ciHHNWB+lZCLKMXbMt32l1st9F3FkYeaD4MWW/lsQccxz5fP1z/56AjQic
         vKqH13Q8MpCGS1rORnyK1jDKgHcL1O+qNEPflkpnRtqiswXxuRnUf7fRrjEhd2x61IBN
         L7vg==
X-Forwarded-Encrypted: i=1; AJvYcCUyTmLctTdsKjpiPfW8soGtdF9QCELIXEKgrix2ITyEBo+q5zqQAYU1aLlpkQc3y9J6sJ/LF89DCzk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzP8iCUQ2qciTrKSTp+OEPjIyzsKr7PCEZAFf8yptOiLqsT20Le
	o1zbzEfv2CMnQ7oIVA2oPQG8n4jJxsS8xJI7OmUcyV1De5sGh2Ok6DeQHXgq/qH5I7A=
X-Gm-Gg: ASbGncvo8EzjTi4yiFrdCAXe8pb3xqeRRhL4Upb4U5pnh78jWZjSi/s5/Z9jmlKahiA
	HfkDNmq6RUM+04L57fgNIiHHuE/et70mvWepHVbv71sS54Jw6pS18sCqkEF939wyF4hdVUse58Z
	KIxS+3wptCPJ5VShGyH5p7HkXdGR49vPEvKDcKg2S7Fz518ocT83fh7NB8iuh411VqrZiix23AY
	ZCDBq6yadlJc2PKHTp5pGracvXlEXbQlmWApMBCbt0OX13SBfhIUxlxHSkaVz2JwMNywSNw7IGR
	wjNtURq91NrHKdWM6hqM8qKbQ2WEsTjPov+0CfBJG/raNTpDNpKpwSYKOezgeyq//DEB0LV79eo
	q8Bpde+/A4M5tQjHOjaBhGvvF2FmPmW2KD3ln9qzvxW1P6ftzeDTZCX5DqB3wD0emKhlvLv/jIV
	Kw+ojYz3CbBz0EPgYhauNUwZqZbVfAuKoGOeZ04bvYTszl57R4YXHzJStTEyNQIHY=
X-Google-Smtp-Source: AGHT+IEVDRzQqxz41bjazvzEtq94PPu5+Ha6Ch7yR6vZUeSxKjd1JAWFRYIDj5wLQhSdXdNmOhf0qQ==
X-Received: by 2002:a17:903:1d1:b0:264:ee2:c3f5 with SMTP id d9443c01a7336-290c9cbcca1mr154193285ad.19.1760934096103;
        Sun, 19 Oct 2025 21:21:36 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246ec14e9sm68762035ad.9.2025.10.19.21.21.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 19 Oct 2025 21:21:35 -0700 (PDT)
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
Subject: [PATCH v4 03/10] riscv: hwprobe: Export Zalasr extension
Date: Mon, 20 Oct 2025 12:20:49 +0800
Message-ID: <20251020042056.30283-4-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251020042056.30283-1-luxu.kernel@bytedance.com>
References: <20251020042056.30283-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_212137_045323_72F9205D 
X-CRM114-Status: GOOD (  10.39  )
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

Export the Zalasr extension to userspace using hwprobe.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 5 ++++-
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 1 +
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 2aa9be272d5de..067a3595fb9d5 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -249,6 +249,9 @@ The following keys are defined:
        defined in the in the RISC-V ISA manual starting from commit e87412e621f1
        ("integrate Zaamo and Zalrsc text (#1304)").
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZALASR`: The Zalasr extension is supported as
+       frozen at commit 194f0094 ("Version 0.9 for freeze") of riscv-zalasr.
+
   * :c:macro:`RISCV_HWPROBE_EXT_ZALRSC`: The Zalrsc extension is supported as
        defined in the in the RISC-V ISA manual starting from commit e87412e621f1
        ("integrate Zaamo and Zalrsc text (#1304)").
@@ -360,4 +363,4 @@ The following keys are defined:
 
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFWMACCQQQ`: The Xsfvfwmaccqqq
         vendor extension is supported in version 1.0 of Matrix Multiply Accumulate
-	Instruction Extensions Specification.
\ No newline at end of file
+	Instruction Extensions Specification.
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index aaf6ad9704993..d3a65f8ff7da4 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -82,6 +82,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZAAMO		(1ULL << 56)
 #define		RISCV_HWPROBE_EXT_ZALRSC	(1ULL << 57)
 #define		RISCV_HWPROBE_EXT_ZABHA		(1ULL << 58)
+#define		RISCV_HWPROBE_EXT_ZALASR	(1ULL << 59)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 0b170e18a2beb..0529e692b1173 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -99,6 +99,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZAAMO);
 		EXT_KEY(ZABHA);
 		EXT_KEY(ZACAS);
+		EXT_KEY(ZALASR);
 		EXT_KEY(ZALRSC);
 		EXT_KEY(ZAWRS);
 		EXT_KEY(ZBA);
-- 
2.20.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
