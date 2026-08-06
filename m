Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B46AC56205
	for <kvm-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 18:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qmh8kQO4YNERPScjimc3xFHfXxSpGURCRkz+SBnw+Os=; b=naIBzW5hAl8WX6
	wFRgBb7J+jX15Ma+ZxJpyW9zdUtLVfMTve/tl5N5yZZBipEXN/uuEOujXzO82tQBps7UzYfrYA8nh
	cUNMbUyvdROT9D0+BRvYdhocfKAOZTssrsj+pXzADYsMdnn3RegeouIQM+Ra8n6z3TDZ0hftSqH/o
	7Pp0G/mClrXstYRJ9FNKvM85Hvk51ju2XL0QCZf3wOA3oel0yYbBcPSzeUVqnw0mehQN4sLQt3oRQ
	g/TlnKRMt4q0eOafizG2b4B1goeMKOl53E/1R+5p2aRln89r0+FLbmmvbuvsJka1E+MxQ6iKHgecK
	zPFRePuMIFze6FtDdUQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws2sP-00000006UEh-0rED;
	Thu, 06 Aug 2026 18:31:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws2sO-00000006UE3-1mI5;
	Thu, 06 Aug 2026 18:31:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A244C60A74;
	Thu,  6 Aug 2026 18:31:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 470951F000E9;
	Thu,  6 Aug 2026 18:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786041091;
	bh=44M6jU/Kh8m/G1eDNu1JXoHIPfmG7QRrcFJA1Q9PNY0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=Dtv22uXuK+7t8r3nCF4xtLj9ZE0N6JSnTz8DbzNOxgEwNM5aQeq+cMVN1sxrQ57ag
	 xtYg1nxiom1fw/NBSWSXcijfhwmbkjDnI4BZsi4d1Bd4ca6hQciNOu/HO02Joy68ED
	 C/MLPgoUtUoAKm9LvILDbulTamZGlhKRrOq2hZQfltwviigCURwFWSPkpa2p9A1aOh
	 Eadr1J/UnRjIIA8Zpa0xjhS4TNuHNiOHMEC08Az7rkZoQmnTgPejxSuefiMC77oG4n
	 P+LGJio5+Qu6DYiunq/Y7+9q8n24rg0AV5eU77Yqja2WXzvT3bT7x58ZO6KAIpnWtZ
	 vNT0nxgWGwmoA==
Date: Thu, 6 Aug 2026 12:31:28 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Guodong Xu <docular.xu@gmail.com>
cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
    Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>, 
    Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
    Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
    Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
    Chen Wang <chen.wang@linux.dev>, linux-doc@vger.kernel.org, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
    Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, 
    Jesse Taube <jtaubepe@redhat.com>, 
    Charlie Jenkins <thecharlesjenkins@gmail.com>, 
    Andrew Jones <andrew.jones@oss.qualcomm.com>, devicetree@vger.kernel.org, 
    spacemit@lists.linux.dev, sophgo@lists.linux.dev, 
    linux-kselftest@vger.kernel.org, Jesse Taube <jesse@rivosinc.com>, 
    Conor Dooley <conor.dooley@microchip.com>, 
    Charlie Jenkins <charlie@rivosinc.com>, Andy Chiu <andybnac@gmail.com>
Subject: Re: [PATCH v5 05/17] riscv: Add Zicclsm to cpufeature and hwprobe
In-Reply-To: <20260701-rva23u64-hwprobe-v2-v5-5-2c61f94a695a@gmail.com>
Message-ID: <3cb41566-deea-689b-c445-2226d7f3f25a@kernel.org>
References: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com> <20260701-rva23u64-hwprobe-v2-v5-5-2c61f94a695a@gmail.com>
MIME-Version: 1.0
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

On Wed, 1 Jul 2026, Guodong Xu wrote:

> From: Jesse Taube <jesse@rivosinc.com>
> 
> Zicclsm requires misaligned support for all regular load and store
> instructions, both scalar and vector, but not AMOs or other
> specialized forms of memory access, to main memory regions with both
> the cacheability and coherence PMAs, as defined in the profiles spec.
> Even though mandated, misaligned loads and stores might execute
> extremely slowly. Standard software distributions should assume their
> existence only for correctness, not for performance.
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
> Tested-by: Charlie Jenkins <charlie@rivosinc.com>
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> [Rebased, rewrote doc text, minor commit message revisions]
> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Signed-off-by: Guodong Xu <docular.xu@gmail.com>

Thanks, queued for v7.3.


- Paul

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
