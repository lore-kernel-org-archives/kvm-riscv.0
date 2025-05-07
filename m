Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 765D0C3ABBF
	for <kvm-riscv@archiver.kernel.org>; Wed,  7 May 2025 17:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QE0bQ1FuDoxQ0qQIi/AizPy6Kom/5Il9Jb3BI3X7c5Q=; b=1LTns2ilEFwV/u
	esJW1sLSO1uxLRHj1UYVvzofx667k5Uo2uLQBIjEKL2aJ8VNxrMAQEKSdXQXR1ITBdMOfWH24jZP7
	SX+hj9YSHYGpCt5sTkGO1U7PzQRkDXLWBzJiGCYhGc+Vpng+KJECFvc3BS1B/nPjQs6AnjXakFaOU
	n8qK3SG9TWQxcSd4xgGj9Db2dXC73LGSOVOFY7bm0oVmXvYfCdeEi3Bvq4JbzDyqTWUfDSko6zhDu
	L0Mbi0JHMxJeOLrQDqGsOyVRTZPbKhG+eaCthD0dwS9tNZKrWaoN7+lOVtZk+SyI8S4F6LUZVXVhw
	BTVmJ/TrKaGrHkj4IRAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiai-0000000GLTA-0w5Q;
	Wed, 07 May 2025 17:29:56 +0000
Received: from out-177.mta0.migadu.com ([91.218.175.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCi4W-0000000GDsm-2pRS
	for kvm-riscv@lists.infradead.org;
	Wed, 07 May 2025 16:56:42 +0000
Date: Wed, 7 May 2025 18:56:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746636997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RqKe5S+kBJ5g+psmAnNRDncbPoduelQxWvprqMMN8Z0=;
	b=V6wxGd5lb06gQoaxfsbumMEc/Q5nPDxudOK3MIErovCU5r8uaDQVrtNYIVNLIglV/yEQ18
	lbnSOXsvJ4kaNeQ7VxExajSM+0ycBh4/Nu2k78IuUZv1jLqSf8vsY4KpITNz/pDEBw+O7I
	e9rURqI7OGGLmkoOnHfmne/5sCmIKvI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, david@redhat.com, 
	pbonzini@redhat.com, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	will@kernel.org, julien.thierry.kdev@gmail.com, maz@kernel.org, 
	oliver.upton@linux.dev, suzuki.poulose@arm.com, yuzenghui@huawei.com, joey.gouly@arm.com, 
	andre.przywara@arm.com
Subject: Re: [kvm-unit-tests PATCH v3 15/16] scripts: Add 'disabled_if' test
 definition parameter for kvmtool to use
Message-ID: <20250507-8159aa2cb83d6a5b44c810d3@orel>
References: <20250507151256.167769-1-alexandru.elisei@arm.com>
 <20250507151256.167769-16-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250507151256.167769-16-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_095641_120439_FECE6FE7 
X-CRM114-Status: GOOD (  19.63  )
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

On Wed, May 07, 2025 at 04:12:55PM +0100, Alexandru Elisei wrote:
> The pci-test is qemu specific. Other tests perform migration, which
> isn't supported by kvmtool. In general, kvmtool is not as feature-rich
> as qemu, so add a new unittest parameter, 'disabled_if', that causes a
> test to be skipped if the condition evaluates to true.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
> 
> This is what Drew said about the patch in the previous iteration [1]:
> 
> 'I like disabled_if because I like the lambda-like thing it's doing, but I
> wonder if it wouldn't be better to make TARGET a first class citizen by
> adding a 'targets' unittest parameter which allows listing all targets the
> test can run on [..]
> 
> If targets isn't present then the default is only qemu.'
> 
> Like I've said on the cover letter, I think making qemu the default (if
> 'targets' isn't specified in the test definition) will mean that new tests
> will not run with kvmtool. I was thinking something along the lines
> 'excluded_targets', with the default (when left unspecified) being that the
> tests run with all the vmms that the architecture support (or, to put it
> another way, no vmms are excluded).
> 
> Or we could go with 'targets' and say that when left empty it means 'all
> the vmms that the architecture supports' - though in my opinion this
> semantic is somewhat better conveyed with the name 'excluded_targets'.

excluded_targets sounds good, but disabled_if is growing on me. So, unless
you or others also prefer excluded_targets, then

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
