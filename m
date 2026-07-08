Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D05C43458
	for <kvm-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 07:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bm4XPYGgTh8fAkx22P5Aqs0E5O9u4vAxa/XzBTbzN2M=; b=4Ai3OGzWn7nGzE
	hkTBR1d2SJ29ZLKky1HZJ/4T0T6YgF5M9smz77yhMXSOWnpcVl4OHB88Cjb2vV+VFHFmHO27j2Ev2
	GefXhrtVRzDmVfGlXlJmQPGYdh9En+gqC3Jnc95BcEBzdmyKAuZX9QWogcuFIct9RsZtHSzljWuey
	M5SCtavdARDV4qhyQwyjibCA9uPxizfiPsSjrrCQW7ife10oxaqc+LhCCC0PpfhAujIqfkxo/DwpV
	94zEikpvaVpI6kptioZ6iaMz4q/Rmng78PBSC5TMgSKzGhIgj2I62wNeUleiZCCWs5paMPTrvyoiN
	0mevgZR/6rr9CdZr2yFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whMce-0000000GUr5-1OUL;
	Wed, 08 Jul 2026 07:23:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whMcd-0000000GUqh-2Ot6;
	Wed, 08 Jul 2026 07:23:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0AC104044A;
	Wed,  8 Jul 2026 07:23:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F0391F000E9;
	Wed,  8 Jul 2026 07:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783495386;
	bh=g2YwrV68FCrFirnBYGtqFd1JPTatKETi9U9WjISw31A=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=X2Cmya1cHeLKtJshVCMlBM9ZnWhFHDHpcJcZb8TF/jzOZBJFCeMbgam57pJSw7eNU
	 s+e5YW6dEMvZoN2C2r7K4447QuRCakW3Yc5o7tFbrKa51/QofHmLLTNhvxzvK8xUXT
	 uPBGrbWZuS1V5/ztmqvW0HoIL0CapAQBjItq6WgpgUaGvRxPj8yBCR3nz7loK/WjuF
	 L6gWCyIXGDHKxLLBduYGPy8E4g+HjXPXSRRlSf1T9vwZUWvEk6k8cGkIbSXE3Poqm0
	 Q5fz/fgyIBzme3FFt1WXS5EsMgcn834EQ9RSPIxq3y00OF72E2ViJDkRT88prOXxWN
	 ueZki51i+3vzA==
Date: Wed, 8 Jul 2026 01:23:04 -0600 (MDT)
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
Subject: Re: [PATCH v5 02/17] riscv: hwprobe.rst: Make indentation
 consistent
In-Reply-To: <20260701-rva23u64-hwprobe-v2-v5-2-2c61f94a695a@gmail.com>
Message-ID: <a8c7d654-703b-4e2f-575f-32ef035f1117@kernel.org>
References: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com> <20260701-rva23u64-hwprobe-v2-v5-2-2c61f94a695a@gmail.com>
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

> From: Andrew Jones <andrew.jones@oss.qualcomm.com>
> 
> A handful of vendor-extension entries indent continuation lines with a
> tab character, while the rest of hwprobe.rst uses spaces.  In addition,
> many list items align their continuation lines under the 'm' of
> ':c:macro:' (column 7) rather than under the item text (column 4), so
> the file mixes several indentation styles.
> 
> Replace the tabs with spaces and align every list item's continuation
> lines under the item text, giving the whole file one consistent style.
> 
> Whitespace-only change, no functional change.
> 
> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> [Guodong: extend from tabs->spaces to normalizing all continuation-line
>  indentation across the file]
> Signed-off-by: Guodong Xu <docular.xu@gmail.com>

Thanks, queued for v7.2-rc.


- Paul

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
