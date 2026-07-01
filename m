Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22ABEC43602
	for <kvm-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 12:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gjOQ4KYnkbPntoy1r4PvO0Erou7roXy1hP5kwip13pg=; b=bPh/DmXkF5/Efb
	V+ccn62OadxZ4yATaA4VECfVW2Nt8rFwLYtFFcW09M+TBFgNc4FNsNohti7T7RYBRKgqCnnM5Vq5I
	tIfui+adpH0KdnLc6ARPlsiSbztpMfU0XvkKvUviZNM54yZJ6MS7Ju/ZMK1iIv3QP6aFwdU07Br+i
	GUxtFbeS04G/kUw0HEAfJ4jRrySgVVOXfVzxVrY8X2mpBeYF4Zz/vfxP/+ipgogVHl/3ouPIfC1W/
	UKRjJWKlLxQJtoPdr4rpa34tMqxFmsEYNBz9do+EFEH0oFuzefsU8diqINiOghuZNQB8TIogqeSLs
	L8vRmyd4fRiJNlKt4yyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuSC-0000000241R-3npd;
	Wed, 01 Jul 2026 12:54:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuSC-0000000240z-1mig
	for kvm-riscv@bombadil.infradead.org;
	Wed, 01 Jul 2026 12:54:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=lNYo/DlbFIEXnMINvFtAOJPsCSUEkojp0EkJfm5QRDw=; b=EddhqU/LUGulOq8Sxb95UggowX
	p9Ev31wHWctX4pBMHi5C2MeBEwhBFjhPDObfrSnHnnOYSYF4tgskuL4KerSGQj3M2hSKDvflcEVnU
	7EIIlWDM/xWSacFxIh8eaCvmXebaGQaWs5+Bd6WzW6zuSSv5XmO8BB3oVoBGcKjzze1mXMWLBiUe3
	KqqDDJiXKq8hnvbNe//oF1487Im/qtXCFo8Ar+xjPAqnzHeqj2+iGllNK/Isip2MFj+ny/uglcjES
	YKUZW04L/iNuGzRaOEkRvMr/wb7qtw0gGDcCObf33aDsA5o06kFoaZByQkoCBOWKQdzuai1q1RHP5
	wTnntZxw==;
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weuS9-00000002mbZ-2Dyy
	for kvm-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 12:54:11 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-847a69ba83dso262835b3a.2
        for <kvm-riscv@lists.infradead.org>; Wed, 01 Jul 2026 05:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782910448; x=1783515248; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lNYo/DlbFIEXnMINvFtAOJPsCSUEkojp0EkJfm5QRDw=;
        b=QBh5R/akqCks4/lm/AcvVSMVPpvFCdXNt2SqYJa+rAahAoJwp6VD7+hHWoRxap88Gy
         LKQ8FMvny4CQC/poqrBTl1UXp/g/eT4UfElo8QLPh1znFHDz0Qf+MWRgk/p4hxph6NCV
         o5Eo2/tF052s4ztGwdrDywlPVUFKUJiRG463sOpvp0RSDJS/HRsnmW31Z6QI8h7R+6og
         gn14J7IVFbrPF67XxIGSuDCIRyFb35aF4c6ACT05ZdgFpblRaqOt22WtXgaDi4Msh4BG
         +LZynSAeUI4R/+tqX2AFoIOJ8s2F2QQm/b9Sv59E2yHsF0kfc4euqm+EmyKPJL/wU2z6
         WDvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910448; x=1783515248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lNYo/DlbFIEXnMINvFtAOJPsCSUEkojp0EkJfm5QRDw=;
        b=gqC7HZkAhbenmQZc4hGQSJslgdm93iqSMC7tNDJIYWrkhJbFRLOqFaUw5U4bwvm0e9
         oZsh1WPsM1+snxpZxVVpqn7qi2jQ06+80iog/jEmcDtPcpDgEqFBJ10GeTzeI1cSYzZh
         3rp3LfkyGjsk023I2sZim7ztVbP6xoXHlZuidxWlqY21tO95Ptv1Ee551tFnZlzkamqT
         B76HMHmmzYChGjQiFrpEa+o9AcTCo7ZSugxvly4mPvadN3KKGCqA23j9iXhKcvgIKoL7
         wPySpP6X5WlNhTbfDQn1BvDHfE34Y/PYvaMEFPrP5lbuDhD4IDttrKt9x0eve6nOiYBI
         St8A==
X-Forwarded-Encrypted: i=1; AHgh+RriBIdTen+wVsim9VXRlwr5tJDLPyDnwpy2UJoy4ffwLOZBxd3GsxqNzBneKoKysmoZnuEH08Bbju0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwBx2iebiq1vTWkkuBCkSiPwHsfNiNTLKGjERRlY0BDTUUNEGUX
	J8bkUMWy0Y9dMVcAwSroHXf7w7TDwwq1Rxe/8KY9ji7w/fQ1WyWtyYre
X-Gm-Gg: AfdE7ckLxxvcbm0Uy6Bas+CYiRz+sJ/xmjBmIGplSbkJLOEMSJqVW7Ps0OK8AxSV47B
	3Dl0SLTHnLEfJK2XQ1/qjn9PBCQSMtFEBK6haMjCjWPOQt0/MIknHGk+qY0o0w4sBfSIthOIT5q
	fubxYIrC12ceRoJQG0dppXEs8Xdr4Pvy5Ij3/RwBzRjBI+asnjInKdp6X9L7YLE0j9OwEeqMS4d
	rddQ8ZaYhFRkpsILTsbDn4eOQ9EXuzYs8QYzJ1TM2nFwuXV62zIRNKowwHrTeovNfFu3dqRGuRi
	Ctibpz3eylTfSym/KYAE+wP+94x8BnzeC0fWjiFAMdymYj2+hx+HKRTeu4O4Hx/fer8UdVrlRAQ
	ibVMHIh+gr2tlNW9+6UfMrDdBPlCqa2v7p90v2RBwRBph6BCiY3QBtvi8BeTkTc/FTJKfHhNTAL
	rJkqDzv5wNSB8U2Vs4SunQ
X-Received: by 2002:a05:6a00:301a:b0:847:834d:b6a6 with SMTP id d2e1a72fcca58-847c09c8450mr1321318b3a.62.1782910447535;
        Wed, 01 Jul 2026 05:54:07 -0700 (PDT)
Received: from [127.0.1.1] ([120.244.9.45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03778basm3999403b3a.49.2026.07.01.05.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:54:07 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 01 Jul 2026 08:52:22 -0400
Subject: [PATCH v5 09/17] dt-bindings: riscv: Add Zic64b extension
 description
MIME-Version: 1.0
Message-Id: <20260701-rva23u64-hwprobe-v2-v5-9-2c61f94a695a@gmail.com>
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
 linux-kselftest@vger.kernel.org, Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2298; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=zzv4RpzLQz9N5QJYuvZNdW9u/BeWJDgXt1lzr+Z9BYs=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixX3tae54HSDm517WVHE/akZ2wyUs87/XY2r8u9ktmSc
 c0q7xk7SlkYxLgYZMUUWQ4fbcne+son2vc55w+YOaxMIEMYuDgFYCJ9qgz/fVW33XNV3v83JiV9
 fpLN0UdfY56kyUUnPP1+YnbxZCv+GYwMhy18OQtd2E9FfmEK/997+L1R7knfy7uueIlOfbDpEO8
 GXgA=
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_135409_738133_F3F16259 
X-CRM114-Status: UNSURE (   9.73  )
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
aligned in the address space. It is a mandatory extension of both the
RVA22 (U64/S64) and RVA23 (U64/S64) profiles, ratified with RISC-V
Profiles Version 1.0.

Document it so it can be described in the riscv,isa-extensions property,
alongside the related Zicbom/Zicbop/Zicboz cache-block extensions. Since
Zic64b fixes the cache block size at 64 bytes, also add a schema check
requiring any present cbom/cbop/cboz block size to be 64.

Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v5: Commit message clean up, fix a double space (Conor).
v4: Insert zic64b at its sorted position (before zicbom).
    Update the commit message.
v3: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml        | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index f4dd34d446c02..bbd442cfbd904 100644
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
   # All three Zicbo* extensions require their block size property as there's no
   # default.
   - if:

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
