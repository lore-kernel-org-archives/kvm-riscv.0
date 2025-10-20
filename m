Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C21EACCD199
	for <kvm-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 04:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DOGHnTrOkgj9XFCq0h17lFvTnfxA9/Xy4KKW3rkPswA=; b=A0CuTPpaZP0Hu5
	WndzisJ5TbDHFgJ+pnIki1GVDzvjC+wyOd8QBY9qOqlOb29IKxiwdfkCg/0OxcdS6YYgnan7zJS/e
	3hWBpUS+3EvJsB9kr0c+dxA5j4PHDgFUoz3rs2rL6F6oqGv5ELYBIT7s5pcP+U3+htJPQN2cyUXap
	72UO+Y4k/m9hq78fISs5hiQ3XRFrpIz6DnSSkp2gEurJpQ6LXf6vujlHpG87LRVIh0e11VJmUx6CQ
	ks37U9R+GR62iqktOvY6sIsogNFjOQmmqik7b5WqV596h5xoq9YVYRI6Tj7n6jh1YSOsbrJhQ2PKd
	DbWoqYXCv/gPRlN+CGBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhOl-0000000Bpln-3yaB;
	Mon, 20 Oct 2025 04:21:32 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhOi-0000000BpjQ-1RMk
	for kvm-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 04:21:30 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-27c369f898fso57348595ad.3
        for <kvm-riscv@lists.infradead.org>; Sun, 19 Oct 2025 21:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1760934087; x=1761538887; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kcpuRb5Zady/Ndj7TK1NVXuo7wdyupAjCmRtQU7qg78=;
        b=Ir7UzfNAqNFuPV/mwA2FjjHI9SvsZmxAfjhMRALv7o9vjnGTwsPZT4e8lyybAEDh/3
         h/r7iJz8oA8/SneD1fEfPqGm2i46mz/EdmXm7Q9/HdAP6qcxR5VToFcjgbc75XUIBwtB
         kJVRogiXPtaUGsWElg1upLp+hU4OdGbeSX1mkkdL4UPUdonuIuG8fPDbDgZKzqlarDGQ
         W3ldtY0V+rbMhNKdIS8zv5SfIYESXs5FjMRiCJ922AcT1w8IUygWr+5o3Ns/sukzNBH5
         dxeDVpcB0CR9J2B1mBT3StzRo+/0SnhaQe/f872Orzug0mcwLrxS0xHEP5TrkFpkJZQN
         9hwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760934087; x=1761538887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kcpuRb5Zady/Ndj7TK1NVXuo7wdyupAjCmRtQU7qg78=;
        b=S7ktPG0siZBuGoNkWe6MmhI3aEIbRKoyDaEPbWp2ZDtfGYxgw3bb1QKPNQrJCjAQY/
         SOJT27REKYVCOVraEBk7BI8zA0TAPc7Pr8UANkFvDNkg9kGW6TxL71j909MADShwnNmB
         oVKjpJeBHJ+GEsmzXry2j9Of9305d64D8bCljsOhCptsTZ09JkMaR/o1U1rZRo46fTlj
         TpneiaGpOYIIvwilApvafhNWqfaAtrGpezO3AlkCeMQRBu9ZDQm1w2jz2zL9hADSuDH/
         9EQr+b5v+Hnuzgd0ysba2KfZv+tX6faGuWPDtEQf9QVwCyUIiuvcK6nqaEo6xO9YaOfl
         fbTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWk+a4OoYisgonk0Gz8oCLrjNAYuhjiVAFFDFojK9/2SLm2bkz3C0uHT0TGJ8fFc/osOt7pxDjlS1I=@lists.infradead.org
X-Gm-Message-State: AOJu0YwBUBVPPQlc6kGwF3Mvh2UEKi23125Zh3on6km6ZxxurL7JMC5z
	1Jx5o3rTqu+x5YX8z20xpnoOnM+marXcxr/jnh7CC2nZjTwqq4j0BN0Bu4EmdH6aL8o=
X-Gm-Gg: ASbGncuWuKkVoPXus9wZHBYzENsfjQHyCLzOjeIvB1F3TaaQTn1dgvQwVGv9OPkysdi
	tzf83biv6de/4g/BuZmffRekaw3/pTCmFowVFWfkHcAY2A45QzhEM0y1snl16+h+0fNZPzue+/O
	KuLkd/D6nYUsa4I0pldmXPBvNreXjgx9ULHrDUgfVD9pxVzMCI4LVHN0hYCPx1umoONPMs8NbVf
	POImWhy04mQt6KWn8mU7y7bOSVmc2X9Ak75xwhMYVVumUSo1lep7RlNYNujeeE6+HILAIeCd27R
	GImm4vEifkPH859hVCpjYMWPSrx6nKlkO6+B7WMR58VuirCHnF8rulEogizQ3a4rTF8bBL5SssI
	5Lc6serf62qMiZsli7dLaKpjMbUpnk4oFFnFEK4VH9n3AjqSQyz4Hm/xcZdgjUVnBKIXdh6rBYI
	arsdUrD1IEl1RsZ3sCMKogVkuz+VzX7cLmrfjs9VRRP2Jj+wrPSttpDGAx5LZxZkmgqcGmIzqqX
	A==
X-Google-Smtp-Source: AGHT+IFwTwTOglfCAcnv2eeIJKbKLKoLeYRBKMVD09UkBscMOUOH5n7kgqBF6beeLtv4Tcs3gbZbaw==
X-Received: by 2002:a17:902:db0b:b0:264:70da:7a3b with SMTP id d9443c01a7336-290cb27af60mr170024945ad.49.1760934087485;
        Sun, 19 Oct 2025 21:21:27 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246ec14e9sm68762035ad.9.2025.10.19.21.21.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 19 Oct 2025 21:21:27 -0700 (PDT)
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
Subject: [PATCH v4 02/10] dt-bindings: riscv: Add Zalasr ISA extension description
Date: Mon, 20 Oct 2025 12:20:48 +0800
Message-ID: <20251020042056.30283-3-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251020042056.30283-1-luxu.kernel@bytedance.com>
References: <20251020042056.30283-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_212128_386322_36B183A6 
X-CRM114-Status: UNSURE (   7.57  )
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
