Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 424ACC021B8
	for <kvm-riscv@archiver.kernel.org>; Tue,  4 Mar 2025 09:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gVYg1XdMNLiXbNZGngy44Utzab+2+obSHqZ/Az+m1Sc=; b=gsjMNQungleDp2
	ZjHXze38Kxlf4QGM68g4S9w6E3oC8w89Kinm7LtitID9YPK86B4B1vDXKR1mbn0SQXjqWRxkUdFX6
	8do1dTwTSBlNvo7nPSDhRS+QKpVwVUsg+hMaXKV6jQwVJdlsnEH1At3aAJfTRZz+gx4TNCZ53rk2Q
	hsbp6YKcahCPh8Jy6lJ44Xm8YTs0yaoduQM5tjY+0d9srN51fa566b/GAb1uydOhjbjgwiLYn6Oeb
	VXZeEHzj3XoomnVVUmsAyO3x4lqwoEBkaz3Xmxt7cpDJatJTuEN6YRrpVYndOx/j/tGtq0L/FYaTi
	Ha5xDgyCwKl0odlZLc6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOKW-00000003oR2-3g35;
	Tue, 04 Mar 2025 09:12:48 +0000
Received: from out-180.mta1.migadu.com ([2001:41d0:203:375::b4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOKT-00000003oKx-47N7
	for kvm-riscv@lists.infradead.org;
	Tue, 04 Mar 2025 09:12:47 +0000
Date: Tue, 4 Mar 2025 10:12:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741079558;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yk65YCoknZT+htaDe9nqwacdmrTmjKV45m85/3fsFhE=;
	b=sQPkZud9kSyo2eP4UHsTl0mo8Gijg6SRFTEvSNzOPWxVZ19igT2P901QlPfY1Uc1Xu/aAm
	hmLNfw82SZlsDeYmKz/xB1QShkteULXP2sYggBN8gJfbIkYeaNr8A7a7Dv65HmgZ//hHTe
	8TmwryZlyMbq+tdY/72ICKmL89aUX34=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	kvmarm@lists.linux.dev
Cc: alexandru.elisei@arm.com, eric.auger@redhat.com, atishp@rivosinc.com, 
	cleger@rivosinc.com, pbonzini@redhat.com, thuth@redhat.com, 
	Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [kvm-unit-tests PATCH 1/2] configure: Allow earlycon for all
 architectures
Message-ID: <20250304-4e2ee456d30819f9a38239c8@orel>
References: <20250221162753.126290-4-andrew.jones@linux.dev>
 <20250221162753.126290-5-andrew.jones@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250221162753.126290-5-andrew.jones@linux.dev>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_011246_298630_EBA09F41 
X-CRM114-Status: GOOD (  20.94  )
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

On Fri, Feb 21, 2025 at 05:27:55PM +0100, Andrew Jones wrote:
> From: Andrew Jones <ajones@ventanamicro.com>
> 
> earlycon could be used by any architecture so check it outside the
> arm block and apply it to riscv right away.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  configure | 88 +++++++++++++++++++++++++++----------------------------
>  1 file changed, 43 insertions(+), 45 deletions(-)
> 
> diff --git a/configure b/configure
> index 86cf1da36467..7e462aaf1190 100755
> --- a/configure
> +++ b/configure
> @@ -78,10 +78,9 @@ usage() {
>  	                           4k [default], 16k, 64k for arm64.
>  	                           4k [default], 64k for ppc64.
>  	    --earlycon=EARLYCON
> -	                           Specify the UART name, type and address (optional, arm and
> -	                           arm64 only). The specified address will overwrite the UART
> -	                           address set by the --target option. EARLYCON can be one of
> -	                           (case sensitive):
> +				   Specify the UART name, type and address (optional).
> +	                           The specified address will overwrite the UART address set by
> +	                           the --target option. EARLYCON can be one of (case sensitive):

I'll add
                                   (arm/arm64 and riscv32/riscv64 only)

since no other architecture is paying attention to the parameter at this
time.

Thanks,
drew

>  	               uart[8250],mmio,ADDR
>  	                           Specify an 8250 compatible UART at address ADDR. Supported
>  	                           register stride is 8 bit only.
> @@ -283,6 +282,41 @@ else
>      fi
>  fi
>  
> +if [ "$earlycon" ]; then
> +    IFS=, read -r name type_addr addr <<<"$earlycon"
> +    if [ "$name" != "uart" ] && [ "$name" != "uart8250" ] && [ "$name" != "pl011" ]; then
> +        echo "unknown earlycon name: $name"
> +        usage
> +    fi
> +
> +    if [ "$name" = "pl011" ]; then
> +        if [ -z "$addr" ]; then
> +            addr=$type_addr
> +        else
> +            if [ "$type_addr" != "mmio32" ]; then
> +                echo "unknown $name earlycon type: $type_addr"
> +                usage
> +            fi
> +        fi
> +    else
> +        if [ "$type_addr" != "mmio" ]; then
> +            echo "unknown $name earlycon type: $type_addr"
> +            usage
> +        fi
> +    fi
> +
> +    if [ -z "$addr" ]; then
> +        echo "missing $name earlycon address"
> +        usage
> +    fi
> +    if [[ $addr =~ ^0(x|X)[0-9a-fA-F]+$ ]] || [[ $addr =~ ^[0-9]+$ ]]; then
> +        uart_early_addr=$addr
> +    else
> +        echo "invalid $name earlycon address: $addr"
> +        usage
> +    fi
> +fi
> +
>  [ -z "$processor" ] && processor="$arch"
>  
>  if [ "$processor" = "arm64" ]; then
> @@ -296,51 +330,14 @@ if [ "$arch" = "i386" ] || [ "$arch" = "x86_64" ]; then
>  elif [ "$arch" = "arm" ] || [ "$arch" = "arm64" ]; then
>      testdir=arm
>      if [ "$target" = "qemu" ]; then
> -        arm_uart_early_addr=0x09000000
> +        : "${uart_early_addr:=0x9000000}"
>      elif [ "$target" = "kvmtool" ]; then
> -        arm_uart_early_addr=0x1000000
> +        : "${uart_early_addr:=0x1000000}"
>          errata_force=1
>      else
>          echo "--target must be one of 'qemu' or 'kvmtool'!"
>          usage
>      fi
> -
> -    if [ "$earlycon" ]; then
> -        IFS=, read -r name type_addr addr <<<"$earlycon"
> -        if [ "$name" != "uart" ] && [ "$name" != "uart8250" ] &&
> -                [ "$name" != "pl011" ]; then
> -            echo "unknown earlycon name: $name"
> -            usage
> -        fi
> -
> -        if [ "$name" = "pl011" ]; then
> -            if [ -z "$addr" ]; then
> -                addr=$type_addr
> -            else
> -                if [ "$type_addr" != "mmio32" ]; then
> -                    echo "unknown $name earlycon type: $type_addr"
> -                    usage
> -                fi
> -            fi
> -        else
> -            if [ "$type_addr" != "mmio" ]; then
> -                echo "unknown $name earlycon type: $type_addr"
> -                usage
> -            fi
> -        fi
> -
> -        if [ -z "$addr" ]; then
> -            echo "missing $name earlycon address"
> -            usage
> -        fi
> -        if [[ $addr =~ ^0(x|X)[0-9a-fA-F]+$ ]] ||
> -                [[ $addr =~ ^[0-9]+$ ]]; then
> -            arm_uart_early_addr=$addr
> -        else
> -            echo "invalid $name earlycon address: $addr"
> -            usage
> -        fi
> -    fi
>  elif [ "$arch" = "ppc64" ]; then
>      testdir=powerpc
>      firmware="$testdir/boot_rom.bin"
> @@ -351,6 +348,7 @@ elif [ "$arch" = "ppc64" ]; then
>  elif [ "$arch" = "riscv32" ] || [ "$arch" = "riscv64" ]; then
>      testdir=riscv
>      arch_libdir=riscv
> +    : "${uart_early_addr:=0x10000000}"
>  elif [ "$arch" = "s390x" ]; then
>      testdir=s390x
>  else
> @@ -491,7 +489,7 @@ EOF
>  if [ "$arch" = "arm" ] || [ "$arch" = "arm64" ]; then
>  cat <<EOF >> lib/config.h
>  
> -#define CONFIG_UART_EARLY_BASE ${arm_uart_early_addr}
> +#define CONFIG_UART_EARLY_BASE ${uart_early_addr}
>  #define CONFIG_ERRATA_FORCE ${errata_force}
>  
>  EOF
> @@ -506,7 +504,7 @@ EOF
>  elif [ "$arch" = "riscv32" ] || [ "$arch" = "riscv64" ]; then
>  cat <<EOF >> lib/config.h
>  
> -#define CONFIG_UART_EARLY_BASE 0x10000000
> +#define CONFIG_UART_EARLY_BASE ${uart_early_addr}
>  
>  EOF
>  fi
> -- 
> 2.48.1
> 

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
