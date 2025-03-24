Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C89C36002
	for <kvm-riscv@archiver.kernel.org>; Mon, 24 Mar 2025 16:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/FbU7Gi8Yhp06EmuCkhESrvE52K9/348Irw0VwWieXA=; b=Zr0QrrHhh6tgmb
	7ETJLLUoDB0PA56Hzh5k4RzD/Q+EMlGmvDAvevUsRuRs2Zchcv+dmy772KK2Ix57QFefQ8QgVRUvS
	kkUDe9iq+Td5+PXhpE2K+F4UZfivUahZ0jVjfoB0b4NLw1ZxZnnEBBNO7wBxa/gbhhQmk60VwUCgR
	S2oPjZp0UAXLkJGBBu75ODKoVSqRCsKtxbTWX6eubS7jQQIf6/QHw32+PnCX33mDW9rhNAD9yCYXu
	ty2xxAeW0NjHBpkUuFdVfK3Wf+Qn845tDe/X2qc4EC6PMLZaCyhJC9Y2MGDyIyhZljyi+dWSUDVaR
	S60s3+s9oidKwX5kcm7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twkuy-00000003hE1-0z3a;
	Mon, 24 Mar 2025 16:44:52 +0000
Received: from out-182.mta0.migadu.com ([2001:41d0:1004:224b::b6])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twkjw-00000003f9i-3Zyr
	for kvm-riscv@lists.infradead.org;
	Mon, 24 Mar 2025 16:33:30 +0000
Date: Mon, 24 Mar 2025 17:33:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742834005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CJjm4Sc7RH099dsaRrn3+hA3WmlW1iY5/eTvXCpC+iA=;
	b=mwF9pWNOmL4QAx8xRrw3JJ6gTshHI/7Pi+XDNWk+GDKM6UXMZdfbiWGiquUUn0ZtBJ9JRt
	3/bBHC4T6lSU6n6kyvTnJ0d/vjGjQI6E6qJmqcmmvz7iojmMah+oWhf/N3yPcaHqWuujM2
	0vHgPbYew2GRNlReqqL1/A4JkaezoS0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: alexandru.elisei@arm.com, eric.auger@redhat.com, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	vladimir.murzin@arm.com
Subject: Re: [kvm-unit-tests PATCH v2 5/5] arm64: Use -cpu max as the default
 for TCG
Message-ID: <20250324-9428d144e09d0876ebfa6f3c@orel>
References: <20250314154904.3946484-2-jean-philippe@linaro.org>
 <20250314154904.3946484-7-jean-philippe@linaro.org>
 <20250322-c669034d2100a75ab6e53882@orel>
 <20250324155045.GB1844993@myrica>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250324155045.GB1844993@myrica>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_093329_098900_E69094D3 
X-CRM114-Status: GOOD (  20.98  )
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

On Mon, Mar 24, 2025 at 03:50:45PM +0000, Jean-Philippe Brucker wrote:
> On Sat, Mar 22, 2025 at 12:27:56PM +0100, Andrew Jones wrote:
> > On Fri, Mar 14, 2025 at 03:49:05PM +0000, Jean-Philippe Brucker wrote:
> > > In order to test all the latest features, default to "max" as the QEMU
> > > CPU type on arm64.
> > > 
> > > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > > ---
> > >  arm/run | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/arm/run b/arm/run
> > > index 561bafab..84232e28 100755
> > > --- a/arm/run
> > > +++ b/arm/run
> > > @@ -45,7 +45,7 @@ if [ -z "$qemu_cpu" ]; then
> > >  			qemu_cpu+=",aarch64=off"
> > >  		fi
> > >  	elif [ "$ARCH" = "arm64" ]; then
> > > -		qemu_cpu="cortex-a57"
> > > +		qemu_cpu="max"
> > >  	else
> > >  		qemu_cpu="cortex-a15"
> > 
> > arm should also be able to default to 'max', right?
> 
> Yes I'll change this.
> 
> I didn't earlier because it failed when I tried it, but it looks like I
> had QEMU=.../qemu-system-aarch64 in my environment variables, overriding
> the default qemu-system-arm (32-bit only). "qemu-system-aarch64 -cpu max"
> doesn't boot 32-bit code, but "qemu-system-aarch64 -cpu cortex-a15" does.
> Anyway, without explicitly setting the wrong QEMU, "-cpu max" works for
> 32-bit.

Hmm, so now I'm not sure we want to change arm to max. Maybe? People
have certainly gotten used to only needing qemu-system-aarch64 to run
both arm64 and arm, so this change would break that. It seems like
qemu-system-aarch64 should also have a 'max32' cpu model, but it
doesn't. So, let's hold off on changing arm to max for now. Users who
want it will have to both change their QEMU binary and specify -qemu-cpu.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
