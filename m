Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E812EC43327
	for <kvm-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 12:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NA/ThmvPBXJd0l8M+Gt1eCQAU2eOWXs4jlVorH8asFA=; b=BHLuXKXaTt3dZs
	4XfHiYUqSa1qvI3gJM0rQKPp+GP6Ig4cknlVm+DGJsq8JKoVn9troZjj88qUv3sd4OhIOvQ42Ol5F
	LtWRv+y/RN+pQMjnHJBQ2OAjMnmankXqSW34d8InFpLlWDZiRP4OmQX7nCBkf4gxdtwkvRE4Val14
	Bqs++wzLHuYM9uh42wjo4+vr3+9uJPDbQeE2XerrSqqC/cDpf7yvIwn8FkR+CGL0dK3CfrAnxCAw4
	N/5G8/1vSm97TQdvzSdw3wG7G7rFfN40mm1tJEV/zAQzMn4iiSJ6cSYH5XxiB2kWyFFTZyj6alHqY
	6/UHGGJIDjOuh+gasMYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuS0-000000023tg-2yi8;
	Wed, 01 Jul 2026 12:54:00 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuRz-000000023sX-0XR7
	for kvm-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 12:54:00 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso465297b3a.2
        for <kvm-riscv@lists.infradead.org>; Wed, 01 Jul 2026 05:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782910438; x=1783515238; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cf4ggToYkrlCapEBsvBHakBfX1zXebmGeq/ps06lv7Y=;
        b=DlKUWDy1b0FZ5DLyj7g+X+2yLoxogiZ68V80gZcNlU1X4USpdUuziCx2kNdudI8HVV
         aDuacZNk9KYw7vf5GTIMZl4AwZ+m6Dsee5reNGKjpi3f9/MTtn/erLgJETbHPuSa+NXH
         nislkYDq/nNuynh+Dm+gBaUJpOmk0jqT+DLsrECpny9t1OBdXsgXaqsZ6uHdzN5+CBg1
         4BhdAaVqbuxQuZY1qFvVqg1x68Vtuy8KRjKxfSUK3I6n7WIQGISLWgvig/D+e2DVxJNe
         ps+7ejvnUyddmlh/OvMp5ZgSf2zOyl+xYoVLZTtZjzxfCbho2zufokXrkchnica+chXU
         UYGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910438; x=1783515238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cf4ggToYkrlCapEBsvBHakBfX1zXebmGeq/ps06lv7Y=;
        b=PZ2tk1fHEHEkXSZMpvK2Qma9p3YzMZsW53lbFDdQyskcekTW+1WpNNgENcSFcmblrL
         RGV4EJr+mu+UjN4slXjVmOj/PbeRZ3x3IrcafO1Xs8y49AXJqGnR9ugs6bD4iOF5Tiob
         gdspFL1ALAahPBM/86I2R8R7qrRNBh+UOK4jeKEMUBzGQ8fvl1QcA4JABz1Jq65CalK3
         S37W7qg9n11yKqzhpMlDrCe5XXO936wqCQQwZ1BE3FMxUQRrzBA1t4a4nds0BdUwFSmM
         IFXM/XQLzkEvDMKC0vx9viPuZjYzcr+rY6LJ1zdNanKtev/q38q+Sb3qnoDjXdSJXnWa
         lKIQ==
X-Forwarded-Encrypted: i=1; AFNElJ9FYx9PaJgtgafBQM62SONlP+SAth4oEhTrvRv9sBc8DD21KQ6uEhdE7FjyI/gNaAEhn8LW0RWgczw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy35ZApP2jlVW25Hq0j3znv13yN/qZmjwvB4/NbH430LKrZocGm
	zxsoBXuz9PQ7pDSZhsfSQ/NOzkqtfIlfmgT+wf1t5xrXYo4xlAN2YyoE
X-Gm-Gg: AfdE7cl+GLKFp2xgszgyXZR4hY78OX5bQudttBoQiV4CN3Wg6+HUa8PO6eWqooA6K2Y
	hko9lyk8ANgze/hvPHtb+Zj4gaeOK3Yh1p6AFnfr9dJjvyhoFTtdY88UYW85TzLIlOJFHn5vpFy
	WwoIHqz1z5D7ESatP0eCobXt1BkYLl7GuGXhS2FHzTEKS0kbbL5FslkmdExLycy06fBQ7fOBpJP
	wFFomqwXNtw+ZJWF+rRz7tBhSmMDeGu6XlzmirGME5MjXsJjJBfvCTlX56zpLjvnO3rMSwBPDcL
	mytofpzsPQoWIGoz4LQ3BypAB15Ymx+yHx12d9JlvBQiGFQlVPApht9t56dAgoFTUwYt3xHUwin
	hqVMAr9psA0qTipaCkofbfaMfgbc/EzQDnOlYPiP7IfIguHaIoBqGtNsj9u2DMqRz9cyRo21vkF
	WienKr8Hd7Wf21fmw+Emdm
X-Received: by 2002:a05:6a00:1807:b0:842:614e:cc94 with SMTP id d2e1a72fcca58-847c07c470bmr1460384b3a.26.1782910438134;
        Wed, 01 Jul 2026 05:53:58 -0700 (PDT)
Received: from [127.0.1.1] ([120.244.9.45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03778basm3999403b3a.49.2026.07.01.05.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:53:57 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 01 Jul 2026 08:52:21 -0400
Subject: [PATCH v5 08/17] dt-bindings: riscv: Require block-size for
 Zicbom, Zicbop, and Zicboz
MIME-Version: 1.0
Message-Id: <20260701-rva23u64-hwprobe-v2-v5-8-2c61f94a695a@gmail.com>
References: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
In-Reply-To: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Chen Wang <chen.wang@linux.dev>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Jesse Taube <jtaubepe@redhat.com>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, sophgo@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Guodong Xu <docular.xu@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1580; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=qUpQI6roeceadtMZx+l2gkdH7v1ZAYzyOmrKiTnQRwE=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixX3tZJ0Su79v3RdX58lNmxpiXmJtcKlQyZK/LSqzvea
 TYzF0p2lLIwiHExyIopshw+2pK99ZVPtO9zzh8wc1iZQIYwcHEKwEQkuxkZOua7fZ3pvVejxeEy
 +4eeNdKc7+brz377VsVu1amK7kMbXjH8007YqzrX6+sFsXM73URmzGLLvRK68UNyxWSL+++Ufmz
 W4wEA
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_055359_178016_0C8154BA 
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

Zicbom, Zicbop, and Zicboz have no default cache block size, so a
devicetree that declares one must also provide the matching
riscv,cbom/cbop/cboz-block-size property. Make it required so a
missing block-size property can be caught by dtbs_check.

Suggested-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v5: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml      | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 5ffc40d599c02..f4dd34d446c02 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -1142,6 +1142,32 @@ allOf:
           not:
             contains:
               const: zilsd
+  # All three Zicbo* extensions require their block size property as there's no
+  # default.
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zicbom
+    then:
+      required:
+        - riscv,cbom-block-size
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zicbop
+    then:
+      required:
+        - riscv,cbop-block-size
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zicboz
+    then:
+      required:
+        - riscv,cboz-block-size
 
 additionalProperties: true
 ...

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
