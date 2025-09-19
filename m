Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE8D6CAC59A
	for <kvm-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 07:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DOGHnTrOkgj9XFCq0h17lFvTnfxA9/Xy4KKW3rkPswA=; b=BwpTRRYfklxfYz
	TvryshoJB4G+BJESJ3rlGrJ8EnKML2CEwD1r+BJfn1QW2XzQHkxtKlCIzrUaZy1947BVY9dStxEdl
	x2ZbM9/ckgZQuV3UTKHPwYCQ3+u3a9jDVuxgQG6M+LxSXpCuvyLGDNnnofxwSP8JpbN6sdXSDTXwm
	hskzPNRO/LCuMvFbE6AW24x4AHLnq73ltCQLjAsP9FTXdopDaGG4yKeMBwfq5BLkBtGsCukdbzHLu
	AvsnXeMGXm5MunmwRbCYQYYmdzZMq5gMUwXOMKcxh/B3w0UVy5TOH40ISaIM47oHE494Kcl2Hfl7o
	N0Jh39M99PrNTK7lajiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVgn-000000025O8-2MHf;
	Fri, 19 Sep 2025 07:37:53 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVgk-000000025LU-3xKH
	for kvm-riscv@lists.infradead.org;
	Fri, 19 Sep 2025 07:37:52 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so1793239b3a.1
        for <kvm-riscv@lists.infradead.org>; Fri, 19 Sep 2025 00:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758267470; x=1758872270; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kcpuRb5Zady/Ndj7TK1NVXuo7wdyupAjCmRtQU7qg78=;
        b=AuYMsTcwoL1+D1ZV6CagSawKxMFw3Vy4mpeew9XZKYCpSaayue6BShL6uPXh2+EPqM
         SC89NxQsyIpz7QqP3wpij44kwjBiCo9JGjl3N9q3usJzutacah0dkjEV2Zw4UCrXpSkl
         7dC025T7GSQGxV/WIkKlPPDcscS7PFhmNxNoOfpR6r2SxM+6E0F4+d2/BBq58UKJVR5L
         prLwXMN48Xz/EHwcp/mIpXinwjjpYAldZqCejiE2aHMWIAbUVp+LHlYbHUDqjlC0SNOW
         OqV/I4NCYvTfVnt0xVKamS5l8tBK5KEffGH/S2tmHzdNEboIZqIT9CUav95KzEO+1+Re
         YHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758267470; x=1758872270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kcpuRb5Zady/Ndj7TK1NVXuo7wdyupAjCmRtQU7qg78=;
        b=s4QLpX7nNw5ugq7seTTt8trKq7ZE8pZ8meeR89XjTrFSXB+Su6tdmFXt8++bUz2ct1
         7udCiCt45bpEu0o4wNce4F6PWEhBGW4Pf8n95BMtusukEyTqHLiR3QRD0kcTQZqe+ZAp
         yQRcExRF1LBXVgEpn+PtQaLdQaOIYVHlpYsVnHU754lqMkuOb9UZMOsW++W457P6LTcI
         A8gKONXrhkkgv72pxx+HVgECx+3No7mVt5v8z4ywZ9jK6CCJhOJ+PEOy2ZnAWp1NGE3+
         IfhHVf8qop5CkzO6gdOPSQn5wrS4kRqdaxM/j/ts7YTXRW0eZMl00uSZFLPsYPZFm1UD
         Ts1A==
X-Forwarded-Encrypted: i=1; AJvYcCWjYZzIaAAm9i77l/O6Lp+f1hmcCCFC1+53sVgpCoBX2q3bdDwNts4xckQSny96h/gTog11Hdx82gw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxxWnjwpeQSOwvySHAWOGC7ZhSZ8F8fV8QELEZZXK8HUC8vHf7H
	auIVbKGIKaDOBW9rZK/ufaxC6Yjy1KdFBPMMm24xdtkvXGRtobOZ8BL6cd3TLcQwUmc=
X-Gm-Gg: ASbGncvDKnZw3d/IeUHO6uxiprnGvjsvFg+8BdwO/jxI4x5+/sUKJR+izNTzpjhGIEY
	MCjMLjgrpwmk3uG6BZjK0iIKHesxweUN2bx0f+PoeknFvumMjkiyxoEtBtvN4d6hNRCd6ayQGY7
	ZX4CFLaXIGB1jdc4XYzozEhCYN5Jc5dOLiFk6Cf2O3EV9LUsN/ADApkAzJNU8dKQwUAmFD5lM1M
	SDw1yjp1NOi6/ltlAVRVtWZiPcmc+mgyed0nkDx9y7OLQSL2GzXEviwx5mskEqdH1118yBGMKw2
	w3cQaP6Y0hi9fZ05fwG4xRxXkzJ2uIPNu4e4DZRtXO5HXjtpxs5hYTFwHUdnmTZiShREDZTIiSx
	gEorOqn9s21yKyjEZyNSlA+XUayERVpwgtxJbKWydFcEfVET4wrtHrmWY5doZugBqL2qi3IpH0h
	8moJI2UYs/EyYFywcWrXIeTEGL14+fMdZPfsxd0nYoQw==
X-Google-Smtp-Source: AGHT+IEgACB1Se8zkEhUh/liD5ZfRMe2E7bZVsNaOovjpda2dN5kxeT40rB2jna9QVBQYl1FDLn0SQ==
X-Received: by 2002:a05:6a20:258e:b0:248:f6f1:200a with SMTP id adf61e73a8af0-2844b5ca29cmr7654865637.1.1758267470068;
        Fri, 19 Sep 2025 00:37:50 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.57])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b550fd7ebc7sm2679096a12.19.2025.09.19.00.37.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Sep 2025 00:37:49 -0700 (PDT)
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
Subject: [PATCH v3 2/8] dt-bindings: riscv: Add Zalasr ISA extension description
Date: Fri, 19 Sep 2025 15:37:08 +0800
Message-ID: <20250919073714.83063-3-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250919073714.83063-1-luxu.kernel@bytedance.com>
References: <20250919073714.83063-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_003750_980160_11B431FF 
X-CRM114-Status: UNSURE (   8.41  )
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

Add description for the Zalasr ISA extension

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index ede6a58ccf534..100fe53fb0731 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -242,6 +242,11 @@ properties:
             is supported as ratified at commit 5059e0ca641c ("update to
             ratified") of the riscv-zacas.
 
+        - const: zalasr
+          description: |
+            The standard Zalasr extension for load-acquire/store-release as frozen
+            at commit 194f0094 ("Version 0.9 for freeze") of riscv-zalasr.
+
         - const: zalrsc
           description: |
             The standard Zalrsc extension for load-reserved/store-conditional as
-- 
2.20.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
