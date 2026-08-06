Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16BFC561E6
	for <kvm-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 08:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=daWnewcj0lqkN72zbzwXt5qVmyOnQWvlZMzOK9W1k1g=; b=OUcuVDLiA2iZPl
	8sOA+hCm5W8lHWnRyNB3I/9bq0bMEakXFvrb7yZC4s+bCgg1ah0w2vbkBabNGnHjGyDIbQpb60S2A
	9hBh1ug7f09Dz15hU3LSSNCdVA1Uh6VxdPUjfISoNc0A7BfKU52rVmA+8jOa44U6mG2oJVY4AhJ+X
	g9FfG4nzweeYlZUIkaJ/DYDcipQq0IO31hkFsF2XnszmOSw+RtSJrp2uhXN5ImgPf7ewTnMKrEgHJ
	ajAmzG6QEQXEJCL9RU54r4EdKM82HxVD/Nw6OUZWwdMbgFXkXeTwUYlcZMeKCloCf0IWEh/yry85d
	mv6lOLqN0DipZ7NaZZBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtcu-00000005GFl-1YWF;
	Thu, 06 Aug 2026 08:38:56 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtcs-00000005GFO-1Jbp;
	Thu, 06 Aug 2026 08:38:55 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1786005532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9nIA4g8t7lcsSLy8SKolUFQCcXI9D58a3Po16VlQMr8=;
	b=FHTUUJudzFS9p3kUWAKr1SALxyX8dITqDTYMVXAx1huMmCgpVLP16nMVY4hcklrJVWcPqR
	w7xImKjr/LQ01tnIrxqVA3UoQHb5TfPHrNmNcr3eIZeGHvSLPuf82pFFMpcMWyY10ggoMy
	6M8g3cUMahaQwRseVEhEYmG1lOJoXFKPwkOVGeUp7vlqmw1KZIqDuCmYf7BySxV4CtRqbn
	x0cePGBoIA0fRtAPfgYtQhpjZh0okiLhwau7Yp6CYyhdXK8F3j98Gh1gIGB9q4/54UFNG6
	MO9amqq1MPvisx9UdAuDyFTvTnWiUYEHsIlwEykL7w0mVNt9CkDznC0ZIY1VFA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1786005532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9nIA4g8t7lcsSLy8SKolUFQCcXI9D58a3Po16VlQMr8=;
	b=ZTgQaNPBgxMk/DdAp7Z2FCXvOe+jMg5wVDgIbdDAwvGdPZW+a8kUN6/Kjq+YrXGTVD/0FE
	PyrDu/wCuK5cK8BQ==
To: Charlie Jenkins <thecharlesjenkins@gmail.com>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti
 <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Atish Patra
 <atish.patra@linux.dev>, Conor Dooley <conor@kernel.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Shuah
 Khan <shuah@kernel.org>, Radim =?utf-8?B?S3LEjW3DocWZ?=
 <radim.krcmar@oss.qualcomm.com>,
 Jesse Taube <jtaubepe@redhat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Charlie Jenkins
 <thecharlesjenkins@gmail.com>, Damien Le Moal <damien.lemoal@wdc.com>
Subject: Re: [PATCH v3 07/17] riscv: Maintain epc on misaligned emulation error
In-Reply-To: <20260707-riscv_insn_table-v3-7-3f8e5f75ba97@gmail.com>
References: <20260707-riscv_insn_table-v3-0-3f8e5f75ba97@gmail.com>
 <20260707-riscv_insn_table-v3-7-3f8e5f75ba97@gmail.com>
Date: Thu, 06 Aug 2026 10:38:51 +0200
Message-ID: <87cxvvd4o4.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_013854_495890_2E49FAF8 
X-CRM114-Status: UNSURE (   6.28  )
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

Charlie Jenkins <thecharlesjenkins@gmail.com> writes:
> Currently the epc is set to zero when there is a misaligned emulation
> error. This will print a misleading error message with the current epc
> value of zero instead of the epc value that triggered the emulation.
> Avoid setting epc to zero to maintain the state of epc.
>
> Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

I see no reason why epc must be set to zero, so:
Reviewed-by: Nam Cao <namcao@linutronix.de>

But to be sure, I add to CC: Damien Le Moal <damien.lemoal@wdc.com>

Damien, any reason that epc must be cleared?

Nam

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
