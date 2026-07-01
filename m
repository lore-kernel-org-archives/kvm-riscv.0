Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A174AC43327
	for <kvm-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 12:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ToHDETEK7kqXD89FkxgneMotv09GJAeBoMGQxEP3OXE=; b=PxStdPKp7KT7qc
	T66FHN/9t0cEEFiXVl2AI+C/jKwMJ6tYCJAgnQoUNNQ5CayD3knmhLtvjv6nGGxpaRiCzHL1W1k1g
	c/p1dpkPMTeHMFjWWRT97xtxPAooThxBIUzU7lD74DIqh0htMVMfTiCazao71fjWFjsh3mFbaSvRX
	uvfUWlvKnAj9ezV0UIInhdlpqkxC9iWBhH8PJBJ29Fr2wsaz326c3j/ynV4XC0Nhn/hsPubaVWPhn
	2p8F7f8Xi4pV+vBcCXEsgDIRscDVMia934iEIaxna9QyOTJeOoql9gh5mgMv5LUNKPT422M7QVlf9
	xuzYCSpANKp93nKG3NVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuSX-000000024E8-0nsE;
	Wed, 01 Jul 2026 12:54:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuSW-000000024DH-23ap
	for kvm-riscv@bombadil.infradead.org;
	Wed, 01 Jul 2026 12:54:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=br1R9cFbOnUnCWiZ0K+QWZ2nkx7lCYM/TPEMcK2Ah0s=; b=P7hR3nYe65sqDvmTynXE+hQt7f
	w27mGqm6LbngJ77yfiwNwoFOW3jhJiAkn8vDVlvKqMIJuR+M2JRiwZURpnkoRNUOrkfZbIXwj8L2p
	zHRxG1ujKzf5xe2bY+UFbKapxe11KyiGwFx0H7lvKTnEJyQBjnYLpm5U44Iy6B3G6Ne4FVgOdLfQx
	ohCX74r8nMuqE/4qDLXlZKUg8dmxMWVI6LvnpyZ3e1bhPk/fvrLFefOx6gRgrDdiGUOt1FyQJgkVn
	HBpVNaVf6FzlTIKYKQ7cPlFxqP02cMEib4rIkb6K9rWoTsDxdOeqm74cZVyKwC6yliP6bFD1CRRF8
	/bRvf3pA==;
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weuST-00000002mg5-2Sev
	for kvm-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 12:54:31 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-842338c18e0so362698b3a.1
        for <kvm-riscv@lists.infradead.org>; Wed, 01 Jul 2026 05:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782910468; x=1783515268; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=br1R9cFbOnUnCWiZ0K+QWZ2nkx7lCYM/TPEMcK2Ah0s=;
        b=jNaYh8zPWlVWi6UEvD9ME0XL+qEl4eIG3CaCpwEOW4phQKF6/UICBuBE1EUUiHvbO5
         vhTm7C2yv2efev4q1j2zK5aNCeFyLa7XNJz0oVd2BigW0Vu/UygaurOdL87RS50xZjCe
         E0aYUVsnOzFRnhjB36iB2s2PW4u62TqjJnv34I0P5tqpmkhshzUko5sStE2IXkygVvlV
         JwvBxx3iUAyGk329tk6erpVWt/jAovHU8MADV9+D6WN7XS62qM30NzHSqcQ/u25/xn5Y
         cWoOqozkKwPYhL01Jy67kkPAuSqBuYS4P1zQ05o0Z9BbuejpDvPfg9hxLTq7bq/cS2CG
         1lsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910468; x=1783515268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=br1R9cFbOnUnCWiZ0K+QWZ2nkx7lCYM/TPEMcK2Ah0s=;
        b=A0QGBOGJzVhZ47rVvviXsE12TE1bTauumOWpkdaVgmT4+MCLMWSiQQ4ahI9q56kyU9
         dfcGO1OPCRr58iS2DUXBvUt890GcjuC4qaZKNTOGtI4jJkf35i7sx5zvQpgBJq/MygQn
         Jvn8gqr9fCbH0zylMCi9c6T8bhORu4MPgOcCfo+c04R7coaueysmx2ah7AoIneVP51f4
         8AC3rARJgYs+mnQN8oC8UlqZWZWjGEu+eqKRrvIiGS9OHRcpauEfSK3/42wzoNDucpHe
         sFhDpQPfWbRIR6tLMaL3o7md1+hkfAVAjl6Z+2ZyokbNDyjR2CwEwCEk5zKyz+SlrN04
         kIZA==
X-Forwarded-Encrypted: i=1; AHgh+RqxnibMROh0vT65CkwXj037kA/pL3zQrci8mGLxl6Trlptp/YZDZLhCa2/vqCXYSnnrQl+x5zGAUTg=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywnt1dyVj5a3F++VwradiHJ+Z27b+q56wYnpRffjujFp1eLpN9J
	hzh51wlOsQOwlKtZJQwZNuEMIjzKI2KiJS6td3PcHC9e1+ppSOnZzALdg/IicjOA
X-Gm-Gg: AfdE7ckWoXDzYlZLzUMhgqGF6HAAlySEWLEQM95XaQxyipBWadUI7JEKrSMHc3KmTBZ
	np2+4yzxnYDzlXOq1uBFk5Hd2QM2sUnNQYCgaFxQntmDiQhDP2aWmKKyqQ+r1TI2I7KWsX1j4lF
	3I7crhtgZnumcLsrGSwr5QLIEpgkWCpRFJipB/+KFBMVl0mNxH4DS3ZYuwI5HQrTwoUX2YOdl5f
	Y75f+98RDPU7ZL8FZeJcd7L9J1tM+tELmIpCTr0UdMlm8dh+SXKVPUAJoyNGQcmF4SqSpx961ae
	YLzIYSERDhTH0nJ+wg/5bpy5oJ5ryhNusrW/e4V866C7OmH4sHTUBsOV8WSaTcwQZZNuW5yOxq9
	Y7U/kLFOL785yJ7PqsYbeJNptLMgKGvfHeQEBG6DSYUBy7hMql/oQ+4AuUHfuTySSor4fsVMMhG
	z7o+8oDCT0+kEUDYJVx5aK
X-Received: by 2002:a05:6a00:b49:b0:845:e44c:2e5 with SMTP id d2e1a72fcca58-847c07c3680mr1376084b3a.22.1782910467604;
        Wed, 01 Jul 2026 05:54:27 -0700 (PDT)
Received: from [127.0.1.1] ([120.244.9.45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03778basm3999403b3a.49.2026.07.01.05.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:54:27 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 01 Jul 2026 08:52:24 -0400
Subject: [PATCH v5 11/17] riscv: dts: spacemit: k3: Add Zic64b ISA
 extension
MIME-Version: 1.0
Message-Id: <20260701-rva23u64-hwprobe-v2-v5-11-2c61f94a695a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6862; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=DMwDkKEw4/W4wb3nG5fYdwj+pS9teyZf57wY87cO440=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixX3rYJk16ueXGt6Ky07qnpjIXlxX9Sp5+dsI9Fep1ZV
 jNvpmZWRykLgxgXg6yYIsvhoy3ZW1/5RPs+5/wBM4eVCWQIAxenAEzkCj8jQ+M2t22+r2Y+nTDh
 0Lm19f3HEw4KleoIrZhZ/MRNyMv+zXmGf5ZeJld1fmRdLfI7ZLjepXL7NNOzaQ/tp7EUyr/vasj
 2ZgIA
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_135429_795131_AC0CA439 
X-CRM114-Status: UNSURE (   8.07  )
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

The K3 X100 cores have 64-byte cache blocks, already described by their
cbom/cbop/cboz-block-size of 64, so they implement Zic64b, a mandatory
RVA23 extension.  Declare it in each core's riscv,isa-extensions.

Reviewed-by: Yixun Lan <dlan@kernel.org>
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v5: Collected Reviewed-by from Yixun Lan.
v4: No change.
v3: New patch.
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 48 ++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index 19fc9b49668ed..9a03b72e271c4 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -35,9 +35,9 @@ cpu_0: cpu@0 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -76,9 +76,9 @@ cpu_1: cpu@1 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -117,9 +117,9 @@ cpu_2: cpu@2 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -158,9 +158,9 @@ cpu_3: cpu@3 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -199,9 +199,9 @@ cpu_4: cpu@4 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -240,9 +240,9 @@ cpu_5: cpu@5 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -281,9 +281,9 @@ cpu_6: cpu@6 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",
@@ -322,9 +322,9 @@ cpu_7: cpu@7 {
 					       "svinval", "svnapot", "svpbmt", "za64rs",
 					       "zawrs", "zba", "zbb", "zbc", "zbs", "zca",
 					       "zcb", "zcd", "zcmop", "zfa", "zfbfmin",
-					       "zfh", "zfhmin", "zicbom", "zicbop", "zicboz",
-					       "ziccamoa", "ziccif", "zicclsm", "ziccrse", "zicntr",
-					       "zicond", "zicsr", "zifencei", "zihintntl",
+					       "zfh", "zfhmin", "zic64b", "zicbom", "zicbop",
+					       "zicboz", "ziccamoa", "ziccif", "zicclsm", "ziccrse",
+					       "zicntr", "zicond", "zicsr", "zifencei", "zihintntl",
 					       "zihintpause", "zihpm", "zimop", "zkt", "zvbb",
 					       "zvbc", "zvfbfmin", "zvfbfwma", "zvfh",
 					       "zvfhmin", "zvkb", "zvkg", "zvkn", "zvknc",

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
