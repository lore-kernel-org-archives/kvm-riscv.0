Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E7A1C43458
	for <kvm-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 07:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6G++NVfWCVhJ3GYFVF66Nqg5a7JNfRyDBgHn9khgDXU=; b=TXxR2yPT/44WXF
	HykIx6nTPzXyyCAW7dhMZDusGwAk+lJOeBibi3s58nWyv0xnPmlwLHpA5sKLBcoUkQTgqoIElKatj
	OQg54xD9CX/JKt+Lf9h8IKuoONoFS7qyMvpDhyW4Ld0i2Ow5pmnCdt1yxvlhn6AZnZTpsba5a07wb
	PqrYnAVTl5f97jALeaJ+OTStsEe9oUBucLrXTcv9RBeholeFnpbvOO3byWfhKkvb2famJwBtLDwnG
	GxHSsigLp2l8H932Bv50a8Zkpg6cVkdsmxMJuDbEaieTscK+1CL67bu45thuQnQh5wbhy+kH3VE8L
	AvAZ4qevuHHeT2wMBPig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whMbt-0000000GUhm-41DI;
	Wed, 08 Jul 2026 07:22:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whMbr-0000000GUha-3bGt;
	Wed, 08 Jul 2026 07:22:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 23D3D60008;
	Wed,  8 Jul 2026 07:22:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 023DB1F000E9;
	Wed,  8 Jul 2026 07:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783495338;
	bh=nXrz1JhJYkK5xTRspbR1Vl1uzVDLKgTjni3ddD1l4bI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=nyhJAboTtmB+ho6GeJp/6cio7XVRXPa1T6M1RlCOTdimLwLY+xzrwBDvzXmPnsuq2
	 mv9kWcMCKFUT5hl7fbZz/yRoVLwoiDyfrPuvMYNNe457u1Qi8y4nrWWNh1hj+1HHf/
	 kMlRCkf16ojSdgwMWOmJnP/Xt4r6lAGeJyY+cwTgGtVksnL5xH2ahCVMK6ZK7kdvF7
	 sOO+nEwHzJ/CgmE5o5O4yWIOECzDqCWI9LPuaq2vQ/039UdRwdVTpQFjPt9z5e4/Gf
	 8L+rEg0VswcoNaRSrv3siM9TIOYteqCLPc7HQOwTZHDpYhIv6s5BweMF7b25+fy9vl
	 B76dTAN3GGf4Q==
Date: Wed, 8 Jul 2026 01:22:16 -0600 (MDT)
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
    linux-kselftest@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 01/17] dt-bindings: riscv: sort multi-letter Z extensions
 alphanumerically
In-Reply-To: <20260701-rva23u64-hwprobe-v2-v5-1-2c61f94a695a@gmail.com>
Message-ID: <a9f1aaa4-aca9-64fa-bf1c-100297a42d22@kernel.org>
References: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com> <20260701-rva23u64-hwprobe-v2-v5-1-2c61f94a695a@gmail.com>
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

> The multi-letter extension enum is documented as being sorted
> alphanumerically (see the "multi-letter extensions, sorted
> alphanumerically" comment), but several Z entries have drifted out of
> order.
> 
> Reorder the affected entries so the multi-letter Z list is sorted
> alphanumerically again.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Guodong Xu <docular.xu@gmail.com>

Thanks, will plan to send this for v7.2-rc.


- Paul

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
