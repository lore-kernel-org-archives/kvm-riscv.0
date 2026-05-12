Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 011F0CD37BE
	for <kvm-riscv@archiver.kernel.org>; Tue, 12 May 2026 02:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:CC:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2eQEhT8CG71IllGVMig2Or4EfJAzHrzCI7l5RIku9sA=; b=VR2MFSNxYswqIuGWrF6aVgLXuR
	f0i+E9If5yg0HbhxQHOfUirpGEdN4FNFIxwAhPjuaJUr37bP5577v1FKYmP0TrUifd/2hXxwqpNei
	q7dUYGfQVJWe0yN5M4o5gopih2e/IF5Js9PT+61XAsWrBP6sin/257qMVSuWT/9FJJvoCbAxNYSSf
	UdtiJs4S5AE57Xsk1mDKYc4WaRnvDvO82Ct5aw05Nqk9oIiuExMgqq1VJgy0lUB/4D9x9z5VxtvED
	SVL2Dhb1FOHMPRipWcqhz+m306IDLzetcW6S6WjesX3tY6sgP7nMlmsA5gmA3FRNRiVdsadK0nyDn
	dSuW2zsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMdBl-0000000FIq4-2XIM;
	Tue, 12 May 2026 02:49:41 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMdBi-0000000FIno-0PqN
	for kvm-riscv@lists.infradead.org;
	Tue, 12 May 2026 02:49:40 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Xme2/5b6VlXBlC6AhlZIW7AoCuhJqHRlKXDBQI9tCDs=;
	b=SVv0YpU1mMlIj9xDev6lT+4U3unfM+VhRMdSD7QlkA/CW7DvlkE/2kllq4BdBsbuy21pZz9Wx
	thLKKLSSRL9OZ0PlK7DeyB9/mOCXbO4dsAzzbbTq+pjCEf7SUW0gUFHeOPEkEMx5BBRx8MoQs0E
	8F1DbwYaNohofOyeqjU7c1s=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4gF17x0Y2GzM42v;
	Tue, 12 May 2026 10:41:49 +0800 (CST)
Received: from kwepemk200017.china.huawei.com (unknown [7.202.194.83])
	by mail.maildlp.com (Postfix) with ESMTPS id E62864055B;
	Tue, 12 May 2026 10:49:24 +0800 (CST)
Received: from [10.174.178.219] (10.174.178.219) by
 kwepemk200017.china.huawei.com (7.202.194.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 12 May 2026 10:49:23 +0800
Subject: Re: [PATCH] KVM: arm64: Add memslot for ST_GPA_BASE in
 check_steal_time_uapi()
To: Mark Brown <broonie@kernel.org>
CC: Paolo Bonzini <pbonzini@redhat.com>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>, Marc Zyngier <maz@kernel.org>, Oliver
 Upton <oupton@kernel.org>, Jiakai Xu <xujiakai2025@iscas.ac.cn>,
	<kvm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-kselftest@vger.kernel.org>, Andrew Jones
	<andrew.jones@oss.qualcomm.com>, Shuah Khan <shuah@kernel.org>, Jiakai Xu
	<jiakaiPeanut@gmail.com>, <kvm-riscv@lists.infradead.org>, Linus Torvalds
	<torvalds@linux-foundation.org>
References: <20260501021639.2563219-1-xujiakai2025@iscas.ac.cn>
 <agKJnKOcvbPZ5cgA@sirena.co.uk>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <fb12c011-27d5-09e2-14fb-ec1728bb6c81@huawei.com>
Date: Tue, 12 May 2026 10:49:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <agKJnKOcvbPZ5cgA@sirena.co.uk>
Content-Language: en-US
X-Originating-IP: [10.174.178.219]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200017.china.huawei.com (7.202.194.83)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_194938_836850_338DB610 
X-CRM114-Status: GOOD (  21.10  )
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

On 2026/5/12 9:59, Mark Brown wrote:
> On Fri, May 01, 2026 at 02:16:39AM +0000, Jiakai Xu wrote:
> > The refactored check_steal_time_uapi() creates a temporary VM via
> > vm_create_with_one_vcpu(), whose default memslot0 only covers GPA
> > 0..~2MB.  Setting st_ipa to ST_GPA_BASE (1 << 30) causes
> > kvm_arm_pvtime_set_attr() to fail with EINVAL because gfn_to_hva()
> > cannot find a valid memslot at the target GFN.
> >
> > Add a memslot at ST_GPA_BASE in the temporary VM, mirroring what
> > the main test already does.
> 
> The regression in Linus' tree that is fixed by this patch is still
> present today.  Adding Marc and Oliver since this bug manifests on
> arm64, adding Anup and Atish since the patch introducing the regression
> was merged via RISC-V.

Does fc240715fc50 [1] fix the selftest regression? It has been included
in the latest KVM/arm64 pull request [2].

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git/commit/?h=fixes&id=fc240715fc5003538ff530e3cfb985e7769b7171
[2] https://lore.kernel.org/kvmarm/20260507154221.2905554-1-maz@kernel.org

> 
> > Reported-by: Mark Brown <broonie@kernel.org>
> > Closes: https://lore.kernel.org/lkml/afM8WEe4gG5tL4fH@sirena.co.uk
> > Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> > Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
> > Fixes: 40351ed924dd30 ("KVM: selftests: Refactor UAPI tests into dedicated function")
> > ---
> >  tools/testing/selftests/kvm/steal_time.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/tools/testing/selftests/kvm/steal_time.c b/tools/testing/selftests/kvm/steal_time.c
> > index 7df2bc8eec02..2b01b466ddc1 100644
> > --- a/tools/testing/selftests/kvm/steal_time.c
> > +++ b/tools/testing/selftests/kvm/steal_time.c
> > @@ -213,6 +213,10 @@ static void check_steal_time_uapi(void)
> >  
> >  	vm = vm_create_with_one_vcpu(&vcpu, NULL);
> >  
> > +	/* ST_GPA_BASE needs a valid memslot for gfn_to_hva() to succeed */
> > +	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, ST_GPA_BASE,
> > +				    1, 1, 0);
> > +
> >  	struct kvm_device_attr dev = {
> >  		.group = KVM_ARM_VCPU_PVTIME_CTRL,
> >  		.attr = KVM_ARM_VCPU_PVTIME_IPA,
> > -- 
> > 2.34.1
> >

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
