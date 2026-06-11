Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA7BCD98C7
	for <kvm-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 20:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ktWfNZPJadJr3prhAS5TBq9aymv9N9F33hIcYAIIjpU=; b=BAjbEwHkcPirI3
	LDjTCifNyL7cGIE1wT/TNFQ6PfC1kpv/bZEqA7Ze/yAN+phnW+AbuhdFuJJ/r1IA2Gkgab3n0UOiq
	bLVIi/muRD38BFPLQxPjq7uTsvb/xxhoMszylOEqLvf327sTF8dnpbb1ho/cHaoKjUmVvd33PJzQQ
	SR96sXku0g1ZYHlwHmJWj5x7g962IzrbEDpqBRWSnVdKm+b2I7kpbdBhTUrIk5w53gAIc66gi8Jj/
	SDLavFguNsZqCNXo7h4e/+007e7ZPmw8IUeHKjnrjnLvNWsTv6axdF/TsDlgpH+SvwbeBat30SzVv
	Dc3ukzOK7hbxs1OkMAQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXln6-0000000A1BA-0tzA;
	Thu, 11 Jun 2026 20:14:16 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXln2-0000000A17i-3LCl
	for kvm-riscv@lists.infradead.org;
	Thu, 11 Jun 2026 20:14:15 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2c27fc587ebso1329205ad.0
        for <kvm-riscv@lists.infradead.org>; Thu, 11 Jun 2026 13:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781208852; x=1781813652; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+UogjurmnadVGaEybH3I8GCYhGRY5wKTkofTPfwNbdk=;
        b=LZgRgky42zsMm2FImowoM7nfozf1bUkC0sPCtYoM1D1AMIR973q/jDUBjsw8f87a/3
         2jqeyRPocp83pfUIcB/ihtcYMqUE+/eOgN4p2/Qu29WRzHl5ObRUa+skfCbLCH6qJIZP
         oOCJ/eAN2D5QHF6O+1KvMTDOi3ShNt0yWqMS+Rc3f0gMfMf4oI7wenebuMzU4Vr61k4K
         Yidb3bWmF3wBoA8NCmAa+RG067ToXXYdoAb2550SrjeeeiGPj1xpMB6dnxSuwNJUr64A
         CpYk4bYOPEdiOVS4QwYFdbvA6sjcRw1BPCzUvjVX104skjLn9MwNcIZdhZzWtmkikq3o
         fEmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781208852; x=1781813652;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+UogjurmnadVGaEybH3I8GCYhGRY5wKTkofTPfwNbdk=;
        b=dkx/PuVQM+9lfAVjJC2oYGCmu84bydP431k73Sn+DQCOIdpTjXay6PtulqJzODUiBx
         FZ6PBFzIsUZEgl5PHJphFLQzUrqT2bbVICTuuC6YRaqmDDZGnEX6ruNQj3QpcsEl1uvT
         1Gcx/zreIM9Ov6eNzXyE18TIi90MdMkKIonfgq2khRtn0c2952OfNeiQ5jISsGJDkfG7
         c9664diy0nth7FIuMi+r8hAtKcf5XpyWPk706CAo2IjGyHoPZf3Y1VNK8QS9LRMiMw/A
         ra384mcmAWvvcH2GVxa/3JXxjjUQU+TzLti3SgMe7l+l/AVad48/B4CO130kXtgHiTat
         Hw2g==
X-Forwarded-Encrypted: i=1; AFNElJ/j3TN7jMZD+z+EKASwp0LTrCejkMdAnWXsIEdvZXh2nFzM8FrMBogaNym/8zeu6NBuMDfjCYFiWNY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz93YQwObUBoj/Ii6eqaqldvCtpM0NUiMg44CSavluvrNhY2f0z
	mcNuBxAUlv+1mH0c8RTr+4IP1rNATNHPMS488dD250z9InhFeMJreVVcUiGJ8zfSs2E/HQ==
X-Gm-Gg: Acq92OGMobc+tNWQJAaJOs0pI3a4DwnfFGKw34AEDLCInWgZGJbvjT7L0I3K3QI3X7i
	rMZCQfGXs0+8M2x+Ii3kefqGXhaoe/axgMf5uD7kK7wpkazNOhvfupiT2k6FE3vsQxBhGGu/OGo
	A5ZyNfhzaVtdM3vK2ojk10Vrpt32voFWcJfRHnULxryuPxAjnyiddTO+NQuqyvr27G4Lo03vg4n
	jbpHoWsvXL24IPBi/Alaenu/HI7P9Ae1qDkt5KxtpaDkcv1OURN81T0zFhYYFGvP9IfKd+IabJE
	ehJren15wLy5d7NwmYhJxjr6MUa9+yEXgwj1hEa2f8zYgWKX7HesKi3OjxjdkXMMpIckD1m4Z47
	3JnQfPlIc46r60ZQHxPGLwnFpQP5T6Zzp8aP4IOf7/fVJsR2PcGx5dzvvqPOCb890neQYPCz1Kg
	==
X-Received: by 2002:a17:902:c407:b0:2c0:c625:4010 with SMTP id d9443c01a7336-2c2f2d5b823mr49982165ad.32.1781208851778;
        Thu, 11 Jun 2026 13:14:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::302d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f875casm288730475ad.22.2026.06.11.13.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:14:11 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Thu, 11 Jun 2026 16:12:45 -0400
Subject: [PATCH v4 08/16] dt-bindings: riscv: Add Zic64b extension
 description
MIME-Version: 1.0
Message-Id: <20260611-rva23u64-hwprobe-v2-v4-8-3f01a2449488@gmail.com>
References: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
In-Reply-To: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, sophgo@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, 
 Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2173; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=vzqxvIv/Z820msoDS14+zD5u3OuYC3MRZkySViyquOA=;
 b=kA0DAAoWgrIluVNoGREByyZiAGorFsGj1LKmqSZuxM3ds1D1JnMhsEQYTedSZCio+Vjz0G5Wp
 4h1BAAWCgAdFiEEw8WEa7XqTFtN5wn4grIluVNoGREFAmorFsEACgkQgrIluVNoGRFeTgEAlm4q
 TS0RrfZZaJySqif9VGXq49FSo90l1aGtPT74WfsA/0Z6QPZvvgDRClq2yD8QKSJAIMfvQbF+DxU
 A/TYM7CQF
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_131412_833221_19632E96 
X-CRM114-Status: UNSURE (   8.90  )
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

Zic64b mandates that cache blocks are 64 bytes in size and naturally
aligned in the address space.  It is a mandatory extension of both the
RVA22 (U64/S64) and RVA23 (U64/S64) profiles, ratified with RISC-V
Profiles Version 1.0.

Document it so it can be described in the riscv,isa-extensions property,
alongside the related Zicbom/Zicbop/Zicboz cache-block extensions. Since
Zic64b fixes the cache block size at 64 bytes, also add a  schema check
requiring any present cbom/cbop/cboz block size to be 64.

Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v4: Insert zic64b at its sorted position (before zicbom).
    Update the commit message.
v3: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml        | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 5ffc40d599c02..1c24999beb59e 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -494,6 +494,12 @@ properties:
             in commit 64074bc ("Update version numbers for Zfh/Zfinx") of
             riscv-isa-manual.
 
+        - const: zic64b
+          description:
+            The standard Zic64b extension for 64-byte naturally aligned cache
+            blocks, as ratified in RISC-V Profiles Version 1.0, with commit
+            b1d806605f87 ("Updated to ratified state.")
+
         - const: zicbom
           description:
             The standard Zicbom extension for base cache management operations as
@@ -1142,6 +1148,20 @@ allOf:
           not:
             contains:
               const: zilsd
+  # Zic64b mandates 64-byte naturally aligned cache blocks
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zic64b
+    then:
+      properties:
+        riscv,cbom-block-size:
+          const: 64
+        riscv,cbop-block-size:
+          const: 64
+        riscv,cboz-block-size:
+          const: 64
 
 additionalProperties: true
 ...

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
