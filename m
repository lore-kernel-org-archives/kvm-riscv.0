Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 314C7C43458
	for <kvm-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 07:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p+qRUPtctPaFKNA/W8+xJ02Fzf62QDL7E52RMndE0dM=; b=o06QA+OrHTXQ2M
	cGVyH+ijDkJvz9Ciox+cD4/HL8lUkZLir1er0g35vDOfzZwBfFRy72ZJ/aFdNP9zL8cjz3TLvn1qB
	wxhZ0oQgMHHkbzZpA1V1STGYHqRpsMBHqQLipc+jleUkMRXwDmTNfgaZOQdp681hjDAXi2YzVBBE/
	y1tZIzth9Z6hJaWyx0vfydmdzQvo3m7GZUd4h/n3Z4tVaGaL4rLbDLB/N+wuDDUhRxRo5Zmtn6zy8
	e8adnXb+X3LMMXhibufKpobuJnJLwN+mkMkIoLKpb7ke2lo2F4CX828n7/RY0cDTFKB55lwWNhaIp
	dNTVrF9R9o1aOiscBd9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whMdG-0000000GV0q-3CrW;
	Wed, 08 Jul 2026 07:23:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whMdF-0000000GV0Y-32vi;
	Wed, 08 Jul 2026 07:23:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2DAEB6001A;
	Wed,  8 Jul 2026 07:23:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E6121F000E9;
	Wed,  8 Jul 2026 07:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783495424;
	bh=17F/Jr3rKociTFUmjiT8hNoe4yR6eIdvM2BSmhwTG1A=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=XrP7tFnPcV4SbOo3PP0s7VRX7iFL46u8xxpncivYDlLIvx2GyNbLhxqf0Iv31POkb
	 0gjM89TK3iJBQJeTZm4arCQ/dFQAOoLpHPoluFZDCq55Ql5HOLgkoMA8NTk15w4SB1
	 p/xTOiDyswU8uSBVuaBVNgsp6wZ1DGCfRRxXmrm5GWBl0LTf87KS+lmq3erZQEUEFa
	 drx4y6FWzPhwg/d3FAL8PMi9CSpIPk8PEu02/oAY7d5C/37JBL6S4PzGnAbfT3rGUY
	 8oKZ74Vu7SCNXdeAdobJdo+/dJXGkgYZzMJf7jBbU0kd+TmQFtcJ6SyAVMJFaynxph
	 K9/7SN+vdBLEg==
Date: Wed, 8 Jul 2026 01:23:42 -0600 (MDT)
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
    linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 03/17] riscv: hwprobe.rst: Document EXT_ZICFISS and
 EXT_ZICFILP
In-Reply-To: <20260701-rva23u64-hwprobe-v2-v5-3-2c61f94a695a@gmail.com>
Message-ID: <e9d78a59-12d8-8969-37bb-583a1a6951c9@kernel.org>
References: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com> <20260701-rva23u64-hwprobe-v2-v5-3-2c61f94a695a@gmail.com>
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

> RISCV_HWPROBE_EXT_ZICFISS and RISCV_HWPROBE_EXT_ZICFILP are defined in
> the hwprobe uAPI but are not documented in
> Documentation/arch/riscv/hwprobe.rst.  Add documentation for them.
> 
> Link: https://github.com/riscv/riscv-cfi/commit/302a2d45c2435940d9a63571c66bc038adc74133
> Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Signed-off-by: Guodong Xu <docular.xu@gmail.com>

Thanks, queued for v7.2-rc.


- Paul

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
