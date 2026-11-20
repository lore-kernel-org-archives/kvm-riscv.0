Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F8860A2601
	for <kvm-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 10:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1ue0uWNk;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qUR9VgQt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GhkkQocpHomJ2NE6zchMP+H3KUV8KfmraZhemIabSTg=; b=1ue0uWNkVLAfMQK1ZzGrhnUnGe
	TNJ4xCcXnUvjTMXc0a38DBObLuyGCsAq9euEx5/EmQKXtIVQPDX0epn/j9nVque4Z0nHx1xm6boKp
	FM7JgOo7oCtEcsndvLUmg2ikso3E1OoRogqASF4bXt0267whP+UouLRUsQtGyhIg2rXSV8wrYerJb
	5fMyYHVOR+1WUFoh1qjqOx/nFCWdFVhU+1p68VJ/0PnmXg+xloqDSX/FUMnXEn9ObjOUJnpkuulSc
	i57nY6oYLqSbZATMP/Nr9E6Znx+WEDKbmvSbga/Q8IwkqfcjAabwtOwXQd0cF94uetc9l1KFsavUq
	c+4jMUlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULby-0000000Ea8m-3fcx;
	Fri, 20 Nov 2026 10:12:54 +0000
Received: from out-201.mta1.migadu.com ([95.215.58.201] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULbw-0000000Ea8O-1Rb5
	for kvm-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 10:12:53 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=StaXluOMaPjpZV2iR4wW4N7xxJTRw3M9e6DSzkM/2cA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795169570; v=1; x=1795774370;
 b=qUR9VgQt5vunHGpHs4jbYAnrgIlh+mJ74+a66KbjDSF+xRVuYpq1FxdV592CsO+4jiuLF2qp
 i7/sPtBa42pzydOt1EhGqbBg0DYOndjy7vusYK4wyUblmvwqUr2I9fokwrfU1hqburx49WeoebJ
 Zs3J0TalvmcAWpjJvGPQl52E=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id db2afc0d12127f3a;
	Fri, 20 Nov 2026 10:12:50 +0000
X-Mizu-Trace-ID: db2afc0d12127f3a
X-Migadu-Flow: FLOW_OUT
Date: Fri, 20 Nov 2026 11:12:19 +0100
From: Andrew Jones <andrew.jones@linux.dev>
To: Xiang W <wangxiang@iscas.ac.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	pbonzini@redhat.com, thuth@redhat.com
Subject: Re: [kvm-unit-tests PATCH v2 6/8] riscv: efi: Allow ACPI boots
Message-ID: <awAcbTDDUt5-g9YD@orel>
References: <20261105082035.133680-1-wangxiang@iscas.ac.cn>
 <20261105082035.133680-7-wangxiang@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261105082035.133680-7-wangxiang@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_021252_567775_0C5A72FE 
X-CRM114-Status: GOOD (  11.39  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 04:20:33PM +0800, Xiang W wrote:
> riscv/efi/run rejected EFI_USE_ACPI=y because CPU, timer and ISA
> discovery aborted without a DT. Those paths can now walk MADT and
> RHCT, so drop the early exit.
> 
> The existing runner already omits -machine acpi=off when

s/omits/adds/

> EFI_USE_ACPI!=y. QEMU virt defaults to ACPI enabled, so no extra
> acpi=on flag is required. DT boots are unchanged: they still pass
> acpi=off.
> 
> Tested with:
> 
>   EFI_USE_ACPI=y EFI_UEFI=/path/to/RISCV_VIRT_CODE.fd \
>     ./riscv/efi/run riscv/riscv-brs.efi
> 
> Signed-off-by: Xiang W <wangxiang@iscas.ac.cn>
> ---
>  riscv/efi/run | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/riscv/efi/run b/riscv/efi/run
> index b9b75440..a53b3a2c 100755
> --- a/riscv/efi/run
> +++ b/riscv/efi/run
> @@ -39,11 +39,6 @@ if [ ! -f "$EFI_UEFI" ]; then
>  	exit 2
>  fi
>  
> -if [ "$EFI_USE_ACPI" = "y" ]; then
> -	echo "ACPI not available"
> -	exit 2
> -fi
> -
>  # Remove the TEST_CASE from $@
>  shift 1
>  
> -- 
> 2.47.3
> 

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
