Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE72E77188
	for <kvm-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 18:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6K/wy2U45opQ4B1LfeSRcoySeJkZuMXMFtbzcbWDiZc=; b=3ycITjTQVP4Hfj
	XX9uWcETtPC3daekZ2mG8feDTvEq75LrdO29RglErPn5yLpEY2jsR82Iu4UM7UKfG3Et4yui+q7Tf
	d80SwuzUUoP6iCb7VnWkQbaJ81pece8r1mwDz4TcqPgDqMiakuxsJ0fFuJCmPwoMywwNsYbYK44uT
	+UqfIJoyFqo9Vf3RU8cDJlG+jEoF8JXZN3BBe5HzVa/dLIbIKgup7zPtFiYffwkYsJtjm6QvBEpD3
	Txl9F6t/QGm0QRjVaJ/wAU9BpFLd8wcbMzthP7TumWUh7yobx+j+bqKWnxi3QctvILpS3yuGIHiMw
	juGDS3VC+E4xI2a8T91w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXlpa-00000009RyH-0J7B;
	Tue, 14 Jan 2025 18:40:02 +0000
Received: from out-175.mta1.migadu.com ([95.215.58.175])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXlpY-00000009Rwu-0LJ6
	for kvm-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 18:40:01 +0000
Date: Tue, 14 Jan 2025 19:39:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736879995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=97WDxuRYiWyXD8yAfu0zZqcacG47H/1aDD9ac4aHZlM=;
	b=LuUcJe8N3NNsLgNnpBIEndO1e8RFDX3UzQ60SV9T974sgFU7FKx6PrAoiVi+cMOHyqjTX3
	+O7D88uR48oFxr5fTzbpYw0WUbRmzLezjmsAJthOY9lo5+6xPs/UhdtRlFWndrGVmWDiEj
	JrN7xiQADyTXP/lFRwjSge76XevVY7U=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, david@redhat.com, 
	pbonzini@redhat.com, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, vladimir.murzin@arm.com
Subject: Re: [kvm-unit-tests PATCH v1 1/5] configure: Document that the
 architecture name 'aarch64' is also supported
Message-ID: <20250114-10fb4c9302167ef202e98713@orel>
References: <20250110135848.35465-1-alexandru.elisei@arm.com>
 <20250110135848.35465-2-alexandru.elisei@arm.com>
 <20250113-0fe04c6089726d1d06a254ec@orel>
 <Z4aY2AKSaxKDY5Hq@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z4aY2AKSaxKDY5Hq@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_104000_265036_03C13E1D 
X-CRM114-Status: UNSURE (   6.99  )
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

On Tue, Jan 14, 2025 at 05:03:20PM +0000, Alexandru Elisei wrote:
...
> diff --git a/configure b/configure
> index 86cf1da36467..1362b68dd68b 100755
> --- a/configure
> +++ b/configure
> @@ -15,8 +15,8 @@ objdump=objdump
>  readelf=readelf
>  ar=ar
>  addr2line=addr2line
> -arch=$(uname -m | sed -e 's/i.86/i386/;s/arm64/aarch64/;s/arm.*/arm/;s/ppc64.*/ppc64/')
> -host=$arch
> +host=$(uname -m | sed -e 's/i.86/i386/;s/arm64/aarch64/;s/arm.*/arm/;s/ppc64.*/ppc64/')
> +arch=$(echo $host | sed -e 's/aarch64/arm64/')

Sure, or avoid the second sed and just do

host=$(...)
arch=$host
[ "$arch" = "aarch64" ] && arch="arm64"

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
