Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C9EDC0219D
	for <kvm-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 12:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s/OFVyOZ0BSY8wz1bOgzoymKJoWdyIyh0sz3TiPph34=; b=M4OUtmMaymq57q
	w8kTReb1cdUQqO1EK5yYPEH8/1SChuHY4gWCVeMYZJ6OlZq84DEUFcAkxqpkc+urB1YG0PUmRGzO5
	GNYnErcJoa8z35hc9kwoEgqMVHQzL5uYtKSuL4UfobzKLif/EL09RPAGeGRES2y9wOnWKSvZP+CDG
	9Q+1e9PoybChgQSes5d0mRFgoPhbLnJY7XUKmaqZWjlgcdLAnkRLvpblzITLvp6m4taFDbIWyzhZy
	7Q0n++vbIRftPFr/UVDDe2L0nDxXs6+k/6Wv8w9V8jxGXS1Y65RxiLw+TiAcvzl/8OC39FBaoBTUH
	LrbUjIEGxe4DwSzRNHAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thpZg-00000003oHg-1HtE;
	Tue, 11 Feb 2025 12:41:12 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thocr-00000003ans-33sS
	for kvm-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 11:40:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5E939A40336;
	Tue, 11 Feb 2025 11:38:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D25A0C4CEDD;
	Tue, 11 Feb 2025 11:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739274024;
	bh=pcp80HDdGNyyYRaaTFdwe56MotwaveT/iimpr56ihOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cy5xeCzTYMkmLEDYlILUUKqPc7p1JV8E+KtZk8TykHU7kMs8fTRJ5mryIJUzX1jhH
	 frPKH/vVGyU8fxN9xKReULQV0NjXeo1EVW/mSekhnG7MwFpgENmcp+amqVjvuLj8Li
	 lfTWE3YK1T6yZvvt8wV7u4IFQrLaz3VYFq0S0Cdt3t54iBKeceDUREuQHMGWInrc0X
	 kno769aq+IbO/kvSP9/pO76n9ThJjiQycDDVMD8aZ67neJGiFzPSGNChSrftVIZweQ
	 lR49dM/OEsGktZuvApa1j0sl6YX6wS575D6l+tpNQkukpGSiab5I70VQgV6dbnK3FS
	 OcJxipNAgQtxw==
Date: Tue, 11 Feb 2025 11:40:19 +0000
From: Will Deacon <will@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: julien.thierry.kdev@gmail.com, maz@kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: Re: [kvmtool PATCH 2/6] Add __KERNEL_DIV_ROUND_UP() macro
Message-ID: <20250211114018.GB8965@willie-the-truck>
References: <20250127132424.339957-1-apatel@ventanamicro.com>
 <20250127132424.339957-3-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250127132424.339957-3-apatel@ventanamicro.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_034025_836035_AC2898C9 
X-CRM114-Status: GOOD (  12.69  )
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

On Mon, Jan 27, 2025 at 06:54:20PM +0530, Anup Patel wrote:
> The latest virtio_pci.h header from Linux-6.13 kernel requires
> __KERNEL_DIV_ROUND_UP() macro so define it conditionally in
> linux/kernel.h.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  include/linux/kernel.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/linux/kernel.h b/include/linux/kernel.h
> index 6c22f1c..df42d63 100644
> --- a/include/linux/kernel.h
> +++ b/include/linux/kernel.h
> @@ -8,6 +8,9 @@
>  #define round_down(x, y)	((x) & ~__round_mask(x, y))
>  
>  #define DIV_ROUND_UP(n,d) (((n) + (d) - 1) / (d))
> +#ifndef __KERNEL_DIV_ROUND_UP
> +#define __KERNEL_DIV_ROUND_UP(n,d)	DIV_ROUND_UP(n,d)
> +#endif

I'm happy to take this for now, but perhaps we should be pulling
in the uapi const.h header instead of rolling this ourselves? Ideally,
kernel.h would disappear altogether.

Will

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
