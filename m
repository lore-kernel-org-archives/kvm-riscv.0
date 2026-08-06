Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFEBCC56205
	for <kvm-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 18:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CMcnxRTILhIZ/WfCvjD2Yb9AN0h2lfulga9nKfotJCI=; b=AyMi/Hy5rgh1D6
	40uzxvmSAceby2KnHLtzeaZcRewWL0eGKr1ONiQoP2XprjqxTCRoiva6xjeZSnep6Zuh5lg1CwZt7
	vpdcpKi7O4NN1G1sBNqFPUuB2DLflj9ioeyo/6fZhyykI1kQk1r4kp2RQvJ7vo5Fy1jbMOYKoKrNo
	trEpJ64p+exUSOAhe554grGReLKP2zv+pjoTwk0ZczW+FqVv21aPHn+UoQe91FOEXB10ljVbcFon3
	E0GYR5YFyFeFIDlsS3YtHXmWUqmOc0QVjjLFLJuFt0a5D/CiSMa2mc4C8LxUCWa1H4odJSV/kPUBK
	cs0YjPcVjaNq0L1KRCfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws2Tn-00000006QuB-07ZW;
	Thu, 06 Aug 2026 18:06:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws2Tl-00000006Qtb-2EPV;
	Thu, 06 Aug 2026 18:06:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E767342E61;
	Thu,  6 Aug 2026 18:06:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B426A1F000E9;
	Thu,  6 Aug 2026 18:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786039563;
	bh=GXPgn1oZ8GLufiYOpYxHEAlYi2lmrI8rfY2EyqvnlW4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=ILRYTfxuiYC2kZl9KdNkWRPvXSjr6MXA0bKS04Cnqir3xLyZGPYgshvgr0YLqEbtn
	 BIezdHZq8hSLipcKPUxQaCtvyt96Erm440ZAtBw1Ng7J20/OoBc+wHpGNED+JFr5lL
	 5HQnj8sm1MTHjAOLMyGchxjuo9m3PAdfArqsrJLnv51uJ2/LqYyO3K5+okVLZpniy4
	 ZuZlMqEl01CrRT3Y6/WrcIkE3x5X7e7mcZDrnroexrYTtUEr5+ky+svBNsEjwPgKLs
	 +QKJJe1PzWW/PpcEvKNloJSO5Zc3FZZykPZ1uMJIh/ZPp95DC4FVTMALmj2jVTTVdI
	 Z3feliwYyDR5A==
Date: Thu, 6 Aug 2026 12:05:58 -0600 (MDT)
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
    linux-kselftest@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH v5 04/17] riscv: Standardize extension capitalization
In-Reply-To: <20260701-rva23u64-hwprobe-v2-v5-4-2c61f94a695a@gmail.com>
Message-ID: <59f93f2b-db1d-f7ff-d893-05dbca87b549@kernel.org>
References: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com> <20260701-rva23u64-hwprobe-v2-v5-4-2c61f94a695a@gmail.com>
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

> From: Charlie Jenkins <charlie@rivosinc.com>
> 
> The base extensions are often lowercase and were written as lowercase in
> hwcap, but other references to these extensions in the kernel are
> uppercase. Standardize the case to make it easier to handle macro
> expansion.
> 
> Acked-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
> [Apply KVM_ISA_EXT_ARR(), fixup all KVM use.]
> Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> Signed-off-by: Guodong Xu <docular.xu@gmail.com>

Thanks, queued for v7.3.

- Paul

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
