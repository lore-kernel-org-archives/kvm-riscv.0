Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2DADC79FB9
	for <kvm-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 11:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HJWsOL6XXFSuJOQFASkwUjTce9VTfuIIsGgcAHjEVs8=; b=Gg1ThGefXtvgFY
	2pTiwPMVr1+EID7IMmXmmQklkmDJIC8CdrTRa6+GIsOBxAfOg6bhS+WHl0If7teynX/k2a/+dX88Z
	6pv2DZdELlef+oTuBuf92gNsAf6Bgxm88lLh//+RnqCEyso6D1A/Z037Nwb/+965zfO7wAofepw4z
	5qUfdGRMHruKrZkE8jg9IxCGFQUE5ZTb/xNUTZped8FccalfM//KNM+c1Uo+6XSKHWEjpsFBGj8rS
	fYPO7pA3P1EUCtjkFetGRHYUo5l84oj3Tu4jnCH4sGmpFDjku5fmSW95yBGzhx/FyZyc4u+R9KKk7
	dHbih9bXIF0msCq0E8MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4dEd-0000000EFv7-1ubr;
	Thu, 10 Sep 2026 11:46:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4dEc-0000000EFu9-1iy2
	for kvm-riscv@bombadil.infradead.org;
	Thu, 10 Sep 2026 11:46:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Message-ID:Date:In-Reply-To
	:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4oV1R7Sem2YZktphiH9OH9k3wSSCyVuVuzldh1QWGuY=; b=aM5AvDbTWowjKFPpE8RnTVqVL1
	jcrI3kSChSiK+PTbKfkXhHGfjDw+oCb5FtBKLwOjlqNjP2dM4V7NW1bOfPOKP9ZettxhhNkjrZMt+
	1I0E5N5He6ieohBjDe9WQYgHuJkXvCDbCtPjdwNYfM8hLYOkW1ub2EnEllQeACwogft5Uw58DF5bd
	pugDrhSqXynVIkAM36HmRqiNckuBltqHqFP84DfIf+uVbTxMjzzPC9xdQjzdQJViC2TbTZFIRQRIR
	VZJR+q+69YXfHt1hoC8RJThOh56cc4KDeY0q3TrynKwrHHvjLrv4DCrQvyt84ro+JIO3wIwBpigj/
	GoLQXHLw==;
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4dEZ-00000002QDw-24AS
	for kvm-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 11:46:29 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-7f4e729368fso6341645a34.0
        for <kvm-riscv@lists.infradead.org>; Thu, 10 Sep 2026 04:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789040785; x=1789645585; darn=lists.infradead.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4oV1R7Sem2YZktphiH9OH9k3wSSCyVuVuzldh1QWGuY=;
        b=VZ53K6v9vY5ZHQp15jqRz4bSYPziex4fES5/64jiABnKFPRuPnXYILefpI1hx9lhmk
         MQZJG0q1oJsoHXWEKsVjctnhjRB5hCOjXcNcSXDZaICzYU3bB0o489ZdMKz1fSwXhRNo
         gwHZ0RnOgFer4NQ4VeeUt0IgZy+kY2ngVeXJiSWYERf1u71Y0I/EluduYWNvBys8vO5t
         hGpR8rnRQh3QeAB6aMBla+8+USk9NYO1/lUIImk/bBnGrzXBZKq1I/I3IdBncxAu4JzR
         TrA9YWq12O/9pZrWksgk969D654bsYYdZZVqAxdh9+LXCX5Q0XvQLWKpKSPK/tKynhPa
         laKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789040785; x=1789645585;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4oV1R7Sem2YZktphiH9OH9k3wSSCyVuVuzldh1QWGuY=;
        b=I0OJqPkcyqyAwuZmKH0EzR0zaZ7zjDf39ONAZrXATk7MLBFAK4mDTppEVbj0Ncqlj7
         pxOZp6Uo+FUS1aQLqpqYLZKQorcv8uAuUzAhSIbE56kw2mn7Zhze7UBeUMZU/Dhju413
         CVt8CemJvsFloywXyUe0LHLEcurFasfS/8ew827SLyrGew0Fl7sxCG4sYw0PafS49z0P
         aHUxao/vYi7lHQgnCFWo3XooaH0ljKz0bOBjlz+cA+6gXbAJD0EU5gsD/+pajQUj1jew
         ftBl4Di88No7AGNCmDiASqapd6uho5kBiT+/7xvvw4/8QctGKFYdbxs5vFbOQlBepzMT
         XyfQ==
X-Forwarded-Encrypted: i=1; AKwUvBxK4ysIU32dR0GQWtykWdQE+Rf3pZLL0eqNFcvLegCy188pKdniE76DwtQBQPwuQ2JhATmB/Xc7sOQ=@lists.infradead.org
X-Gm-Message-State: AFuF++l8z1X4AYD1WTRB/K8eUPHkb6V73zSiKYauRn0Os8bH6T6999KM
	K6efR8NPnV/OF0KuL3jSFXEq8xzEOwbInTn0R/gwQXkkcd/0kof4H4Z5
X-Gm-Gg: AYBFou2Ln4GcMLn8TM7/tC9pjZHLP6LChfDT86wNmwFwSr4CwleIRHuJJ5WhiJRIDCY
	+33SMc2b2LiSCvHY2utuB3krwpt4DxE4ueiOLqLN4PcpFH0SNO3pz1PCmjcvk0V3UocwidOqQl2
	spL/s+D/J5ayTa5IUdLemQXQ7v9u9OGKM8rKyyusmto21Bo6Ba5b0ncJb6w1cg87e774LY5egEA
	iqL5vYN0jEmvoOjC96j9CPDLc8ZxP3hpeRFZbsDywwKXDDrwzCL4SETHZ2qAm621w3fFyrLqwVj
	bKDCP1vtzElwXdRrfbILQRom5eLnnfIxH/5PRJl+Ss0XgM0ue1QTDVMfSz58t+PbOCLSR8bRxpu
	nNasVkRcOVmyPkyr2iSIPaROjNjiWeuCpwYtNstNcGZam/+L9akwN1Bme8p+PMrT6ZJhrdJtejS
	M0xmYYYYIJmefmzP6YP5q1nLsQmHI/DPxgwPGvVBDTcywkwDdGeMvj+YYD0Emv4gtl/lO+5P52H
	7WZD9oA1pMehBxvgbcEtKwIdN0EbEdgx7dcaDQf1bcfJ8yXMAmIC7g=
X-Received: by 2002:a05:6820:180d:b0:6b7:8415:d78f with SMTP id 006d021491bc7-6b78415d8bbmr19129181eaf.58.1789040785360;
        Thu, 10 Sep 2026 04:46:25 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143240d86c3sm46857652c88.0.2026.09.10.04.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:46:24 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 17/20] KVM: selftests: Take the memory region type, not memslot, in page allocators
In-Reply-To: <20260902164123.2546762-18-seanjc@google.com>
Date: Thu, 10 Sep 2026 17:10:56 +0530
Message-ID: <33vh1ghj.ritesh.list@gmail.com>
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-18-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_124627_678062_32F6F1AA 
X-CRM114-Status: UNSURE (   8.18  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Sean Christopherson <seanjc@google.com> writes:

> Take the memory region type instead of the memslot in all page allocator
> APIs, except for the innermost quad-underscores function.  This will allow
> automatically selecting the minimum GPA based on the allocation type, which
> can't be done using the memslot due to all regions sharing a single memslot
> by default.  PowerPC support will also leverage the type to ensure that
> page table allocations are naturally aligned.
>

yup, PowerPC can leverage this.

> No functional change intended.
>

Sure, even though the callers are changed to pass type instead of slot,
the inner page allocator is moved to pass vm->memslots[type] to
____vm_phy_pages_alloc(). So no functional change.

LGTM.
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
