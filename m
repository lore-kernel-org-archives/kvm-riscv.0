Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF82BC56205
	for <kvm-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 16:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tY0VGIgo8dJ6cO2VemfXWmI5A0ZDjrX3QHjcgUCumaA=; b=PN79jgKjdlrRE7
	H9zSlJPWcct1AHx/7ESmfT9hQnrgY4OPc4tOMqKHq/YuaiWxYt+sjnsQ0B+0Xy77kxB7I6AysioqG
	if7mDZ95yH9uXhV6Gin5idBpkUoaIOqnO+qDZ8W4DYPB0oRLqSBYUK0eTxdzSjd2MKrO8NXGv9nOf
	ZNsbyvxDXefCZOgxUL2PUxM78drnwx3QdzRHT+0Zv1W/7qlsOUUCuEGkPMJglIDRknAvgIRk6BQkY
	LIyf7+ueAwIVhuwTjaWcrMnHd0sKTa/yRwzjK//DnT49sgE9b3v6Kb1m10g7mIkmTDe4k/O1ZIc2j
	Mfbw8bQItcH/YQ4x7QkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws15C-00000006EfL-217E;
	Thu, 06 Aug 2026 16:36:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws15B-00000006EfA-0lb2;
	Thu, 06 Aug 2026 16:36:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CE51F419C8;
	Thu,  6 Aug 2026 16:36:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 276711F000E9;
	Thu,  6 Aug 2026 16:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786034196;
	bh=dYgTROmA3S9YYxoIX0RnvvNWtlrrmgkIbAsRfNBVPWk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=W2tNMIwEAfNCTwDDnhL0AFQucPE5sv85OfGCC5ymuYtjo8GULNbbUz0sRypf8w/Hb
	 2wUIU99yWex7ZwO/wqqjm1+lQxJtFRF9cn/XlibJHtYd7gQqvN61fC9TBx8cFl8Ejy
	 Nb+/TZJ6cpRATbqWrcXFyTG171V8vI1eb6kTf90x3qJ73U68vo7ffd+ip0vQW/U83+
	 2Jj+qC6v4Y3zYwtkBToz2v49qwTjn92dDszm0ferAxlrCm1IpXR0ONxCXUJjoEKeNx
	 P6VXwozmDt/s27fPNPoEgrGIAZ+8pR7V+eQjbm+SxK+DYsuaKWjaQF6jZxOO+L38qU
	 KMaDmaySwmZag==
Message-ID: <956a07d1-8f70-4376-9505-623db0223479@kernel.org>
Date: Thu, 6 Aug 2026 09:36:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/17] riscv: Maintain epc on misaligned emulation
 error
To: Nam Cao <namcao@linutronix.de>,
 Charlie Jenkins <thecharlesjenkins@gmail.com>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atish.patra@linux.dev>, Conor Dooley <conor@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>,
 Jesse Taube <jtaubepe@redhat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>
References: <20260707-riscv_insn_table-v3-0-3f8e5f75ba97@gmail.com>
 <20260707-riscv_insn_table-v3-7-3f8e5f75ba97@gmail.com>
 <87cxvvd4o4.fsf@yellow.woof>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <87cxvvd4o4.fsf@yellow.woof>
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

On 2026/08/06 1:38, Nam Cao wrote:
> Charlie Jenkins <thecharlesjenkins@gmail.com> writes:
>> Currently the epc is set to zero when there is a misaligned emulation
>> error. This will print a misleading error message with the current epc
>> value of zero instead of the epc value that triggered the emulation.
>> Avoid setting epc to zero to maintain the state of epc.
>>
>> Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
> 
> I see no reason why epc must be set to zero, so:
> Reviewed-by: Nam Cao <namcao@linutronix.de>
> 
> But to be sure, I add to CC: Damien Le Moal <damien.lemoal@wdc.com>
> 
> Damien, any reason that epc must be cleared?

It has been a while since I touched this, and frankly, I do not remember at all.
As the original commit 956d705dd279f says: Code heavily inspired from the
OpenSBI project. So I may have copied this without thinking too much. That's
likely Anup's code, so maybe Anup can weight in here.


-- 
Damien Le Moal
Western Digital Research

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
