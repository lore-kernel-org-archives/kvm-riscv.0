Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08ED606A33A
	for <kvm-riscv@archiver.kernel.org>; Sat, 21 Nov 2026 12:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HnYcw9Cc;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rQSz0yWH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=e5ec5U5pI8/fuePLBJJnVXu0O8QjWrXic81x19cyQnM=; b=HnYcw9CcgTTy1JnraOlf9v5FYV
	OimFszsBGgCnu7uZrfl6/nrECTcKzRDLEFz711t7uzQVwx7gK9T0ZER4iqUfEUQ/NasmeXfT0USs9
	0ZQh75aR43TXlaUOoXd7EV10m2vIuy9KCI2xNx+f1KauT1+IVY7udVH8wTH4ZLRqXjebi7wAx+HRv
	uEZ6CU6/7kzgvoInEzDYdtt5cwbJpCNlAdqO4GVjHAPCd+DGrU24Gj1GyKFAt5hUIIyn4iiF4bq2U
	B0YUtsYmFJ1l5gT6lFjTWkq+yWc3DmOQsoclc9IloLiYGvqlTIXbxKzruSWW63G7AnvdXBIyJ7bnZ
	i3waYOZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUk8o-0000000H9jk-0VHX;
	Sat, 21 Nov 2026 12:24:26 +0000
Received: from out-77.mta1.migadu.com ([95.215.58.77] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUk8l-0000000H9iW-1Mhx
	for kvm-riscv@lists.infradead.org;
	Sat, 21 Nov 2026 12:24:25 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=kGo36nDWG3R/lg7h5mo5U2JYd2ZrcZDPHK/RX0L5Sqg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795263858; v=1; x=1795868658;
 b=rQSz0yWHSitaI5TMgyh9cLcZsijOZRJdEfSQ/SK1ppGtIJjX3TZrCslafhecHOIbdnl3Uq69
 HIR51w/UdxpAdRuue7H0sg6PTb1IVHA5ofoN5NpdQ7rkC/DOHkG+Q6GBw5UmuBd7pXM3rH0av6w
 +Fj2Ei3wfke+PG66Fw/BhC3s=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 7318615b7222aebb;
	Sat, 21 Nov 2026 12:24:18 +0000
X-Mizu-Trace-ID: 7318615b7222aebb
X-Migadu-Flow: FLOW_OUT
Date: Sat, 21 Nov 2026 13:23:43 +0100
From: Andrew Jones <andrew.jones@linux.dev>
To: Koichiro Den <den@valinux.co.jp>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Bingyu Xian <shanbeeyoo@gmail.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] RISC-V: KVM: Batch user accesses when updating steal
 time
Message-ID: <awGJaUFUmBOa4xfO@orel>
References: <20261118062242.2914385-1-den@valinux.co.jp>
 <20261118062242.2914385-2-den@valinux.co.jp>
 <awB1hZGh3LYztjqL@orel>
 <awB6FpVOpZ9fhMt1@z790sl>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <awB6FpVOpZ9fhMt1@z790sl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_042423_915367_95973667 
X-CRM114-Status: GOOD (  23.71  )
X-Spam-Score: -2.1 (--)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 21, 2026 at 02:20:17AM +0900, Koichiro Den wrote:
> On Fri, Nov 20, 2026 at 05:40:29PM +0100, Andrew Jones wrote:
> > On Wed, Nov 18, 2026 at 03:22:41PM +0900, Koichiro Den wrote:
> > > Updating the SBI STA shared structure performs 2x get_user() + 3x
> > > put_user() calls, each of which toggles sstatus.SUM.
> > > 
> > > Keep SUM enabled across all five accesses to the shared structure.
> > > 
> > > Note that write barriers are added to order the odd sequence store
> > > before the steal-time update and the even sequence store after it.
> 
> Hi Andrew, thanks for the review.
> 
> > 
> > The barrier additions should probably be posted separately with a Fixes
> > tag.
> 
> That's exactly what I wasn't sure about when I read the ISA spec.
> It was unclear to me from the Zicsr ordering rules whether the SUM toggle in
> the old code's get_user() and put_user() calls also order the stores to 'sequence'
> and 'steal' as seen by another hart.
> (I don't think they do, but I'm not 100% sure. It feels a bit like trying to
> prove a negative, as I couldn't find a clear statement. I may have missed one
> though. OTOH, the new code surely needs the barrier, so I included them.)
> 
> Do you read the spec as allowing another hart to observe those stores out of
> order in the old code? If so, I agree the barriers can go in a separate patch.

Yes, we always needed the barriers since we need something to pair with
the virt_rmb()'s in pv_time_steal_clock(). get/put_user weren't covering
for that omission either because CSR accesses are weakly ordered.

> 
> > 
> > > 
> > > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > > ---
> > > To reviewers: please let me know if you'd prefer
> > > scoped_user_rw_access() here.

For scoped_ or not, whatever you think reads the best. I prefer scoped_
when it makes sense, as it's harder to get wrong, but readability also
matters.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
