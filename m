Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15410C02182
	for <kvm-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 16:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sEu3DlDxmJuW6vV49tCxMtwrUTQNYwmrkDXQWjcFnME=; b=H66CXS+eGdsyST
	Nz0rILJIb4foydKufwJjro3853e3LJgQeiq/DySENjdGGev0NMjDLldB6xLO0dl+56kKlU3Dq9Cdh
	DRyR4bpG/gv9HUdsC0RwFMF8tqLG+iGVMY7RRqmKwpedg6r3KPxHswi8NC3WMkbQQlOq8+qDiPfuq
	yuN2Ahqrvm4QDij59DV6xikyyVk7sbSzN+vnAt3s6hrqpd84/z3EnabY6Nd5dJ5evv+c03wEP9Pey
	Ar8qzBZ9tsjfbYRubqAuEw+3GLjfcvUae1uNsc5APMKFhPu2ADd+n6mt1XfWzfFt2ogMoW7apCt7M
	hPwJcIiNmuzCvD0JKA1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taHSA-00000008Ouu-3Lgr;
	Tue, 21 Jan 2025 16:50:14 +0000
Received: from out-187.mta1.migadu.com ([2001:41d0:203:375::bb])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taHS8-00000008OsJ-0HiF
	for kvm-riscv@lists.infradead.org;
	Tue, 21 Jan 2025 16:50:13 +0000
Date: Tue, 21 Jan 2025 17:50:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737478209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9o9toXjXchxuXb1mbAx2+gmT8fvOBZnIXdfInm+D/aM=;
	b=rtj0/bwzCyqvtrhaxqugGe2yTMMDMyQdQVt26GYW3LfnEZGr/FkaHtaK+9BBohA9Fer3GU
	iQxCzAawmvRe5+YcIMPEJ0HfhT6HVkpz1//kiNxxGLa+cVveUDP9L5rTqnXsMZwW4m9nx1
	34ELjNr9KI9WUusTseG9Fu9SnLCc+bY=
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
Subject: Re: [kvm-unit-tests PATCH v2 11/18] arm/run: Add support for kvmtool
Message-ID: <20250121-98b6da755bc353722fae5f1f@orel>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
 <20250120164316.31473-12-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250120164316.31473-12-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_085012_253870_9C79A53C 
X-CRM114-Status: GOOD (  18.81  )
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

On Mon, Jan 20, 2025 at 04:43:09PM +0000, Alexandru Elisei wrote:
> Teach the arm runner to use kvmtool when kvm-unit-tests has been configured
> appropriately.
> 
> The test is ran using run_test_status() because kvmtool does not have a
> testdev device to return the test exit code, so kvm-unit-tests must always
> parse the "EXIT: STATUS" line for the exit code.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  arm/run | 183 ++++++++++++++++++++++++++++++++++----------------------
>  1 file changed, 110 insertions(+), 73 deletions(-)
> 
> diff --git a/arm/run b/arm/run
> index 9b11feafffdd..880d5afae86d 100755
> --- a/arm/run
> +++ b/arm/run
> @@ -17,77 +17,114 @@ qemu)
>     exit 3
>  esac
>  
> -processor="$PROCESSOR"
> +arch_run_qemu()
> +{
> +    processor="$PROCESSOR"
> +
> +    if [ "$QEMU" ] && [ -z "$ACCEL" ] &&
> +       [ "$HOST" = "aarch64" ] && [ "$ARCH" = "arm" ] &&
> +       [ "$(basename $QEMU)" = "qemu-system-arm" ]; then
> +        ACCEL="tcg"
> +    fi
> +
> +    set_qemu_accelerator || exit $?
> +    if [ "$ACCEL" = "kvm" ]; then
> +        QEMU_ARCH=$HOST
> +    fi
> +
> +    qemu=$(search_qemu_binary) ||
> +        exit $?
> +
> +    if ! $qemu -machine '?' | grep -q 'ARM Virtual Machine'; then
> +        echo "$qemu doesn't support mach-virt ('-machine virt'). Exiting."
> +        exit 2
> +    fi
> +
> +    M='-machine virt'
> +
> +    if [ "$ACCEL" = "kvm" ]; then
> +        if $qemu $M,\? | grep -q gic-version; then
> +            M+=',gic-version=host'
> +        fi
> +    fi
> +
> +    if [ "$ACCEL" = "kvm" ] || [ "$ACCEL" = "hvf" ]; then
> +        if [ "$HOST" = "aarch64" ] || [ "$HOST" = "arm" ]; then
> +            processor="host"
> +            if [ "$ARCH" = "arm" ] && [ "$HOST" = "aarch64" ]; then
> +                processor+=",aarch64=off"
> +            fi
> +        fi
> +    fi
> +
> +    if [ "$ARCH" = "arm" ]; then
> +        M+=",highmem=off"
> +    fi
> +
> +    if ! $qemu $M -device '?' | grep -q virtconsole; then
> +        echo "$qemu doesn't support virtio-console for chr-testdev. Exiting."
> +        exit 2
> +    fi
> +
> +    if ! $qemu $M -chardev '?' | grep -q testdev; then
> +        echo "$qemu doesn't support chr-testdev. Exiting."
> +        exit 2
> +    fi
> +
> +    if [ "$UEFI_SHELL_RUN" != "y" ] && [ "$EFI_USE_ACPI" != "y" ]; then
> +        chr_testdev='-device virtio-serial-device'
> +        chr_testdev+=' -device virtconsole,chardev=ctd -chardev testdev,id=ctd'
> +    fi
> +
> +    pci_testdev=
> +    if $qemu $M -device '?' | grep -q pci-testdev; then
> +        pci_testdev="-device pci-testdev"
> +    fi
> +
> +    A="-accel $ACCEL$ACCEL_PROPS"
> +    command="$qemu -nodefaults $M $A -cpu $processor $chr_testdev $pci_testdev"
> +    command+=" -display none -serial stdio"
> +    command="$(migration_cmd) $(timeout_cmd) $command"
> +
> +    if [ "$UEFI_SHELL_RUN" = "y" ]; then
> +        ENVIRON_DEFAULT=n run_test_status $command "$@"
> +    elif [ "$EFI_USE_ACPI" = "y" ]; then
> +        run_test_status $command -kernel "$@"
> +    else
> +        run_qemu $command -kernel "$@"
> +    fi
> +}
> +
> +arch_run_kvmtool()
> +{
> +    local command
> +
> +    kvmtool=$(search_kvmtool_binary) ||
> +        exit $?
> +
> +    if [ "$ACCEL" ] && [ "$ACCEL" != "kvm" ]; then
> +        echo "kvmtool does not support $ACCEL" >&2
> +        exit 2
> +    fi
> +
> +    if ! kvm_available; then
> +        echo "KVM required by kvmtool but not available on the host" >&2
> +        exit 2
> +    fi
> +
> +    command="$(timeout_cmd) $kvmtool run"
> +    if [ "$HOST" = "aarch64" ] && [ "$ARCH" = "arm" ]; then
> +	    run_test_status $command --kernel "$@" --aarch32
> +    else
> +	    run_test_status $command --kernel "$@"
> +    fi
> +}
>  
> -if [ "$QEMU" ] && [ -z "$ACCEL" ] &&
> -   [ "$HOST" = "aarch64" ] && [ "$ARCH" = "arm" ] &&
> -   [ "$(basename $QEMU)" = "qemu-system-arm" ]; then
> -	ACCEL="tcg"
> -fi
> -
> -set_qemu_accelerator || exit $?
> -if [ "$ACCEL" = "kvm" ]; then
> -	QEMU_ARCH=$HOST
> -fi
> -
> -qemu=$(search_qemu_binary) ||
> -	exit $?
> -
> -if ! $qemu -machine '?' | grep -q 'ARM Virtual Machine'; then
> -	echo "$qemu doesn't support mach-virt ('-machine virt'). Exiting."
> -	exit 2
> -fi
> -
> -M='-machine virt'
> -
> -if [ "$ACCEL" = "kvm" ]; then
> -	if $qemu $M,\? | grep -q gic-version; then
> -		M+=',gic-version=host'
> -	fi
> -fi
> -
> -if [ "$ACCEL" = "kvm" ] || [ "$ACCEL" = "hvf" ]; then
> -	if [ "$HOST" = "aarch64" ] || [ "$HOST" = "arm" ]; then
> -		processor="host"
> -		if [ "$ARCH" = "arm" ] && [ "$HOST" = "aarch64" ]; then
> -			processor+=",aarch64=off"
> -		fi
> -	fi
> -fi
> -
> -if [ "$ARCH" = "arm" ]; then
> -	M+=",highmem=off"
> -fi
> -
> -if ! $qemu $M -device '?' | grep -q virtconsole; then
> -	echo "$qemu doesn't support virtio-console for chr-testdev. Exiting."
> -	exit 2
> -fi
> -
> -if ! $qemu $M -chardev '?' | grep -q testdev; then
> -	echo "$qemu doesn't support chr-testdev. Exiting."
> -	exit 2
> -fi
> -
> -if [ "$UEFI_SHELL_RUN" != "y" ] && [ "$EFI_USE_ACPI" != "y" ]; then
> -	chr_testdev='-device virtio-serial-device'
> -	chr_testdev+=' -device virtconsole,chardev=ctd -chardev testdev,id=ctd'
> -fi
> -
> -pci_testdev=
> -if $qemu $M -device '?' | grep -q pci-testdev; then
> -	pci_testdev="-device pci-testdev"
> -fi
> -
> -A="-accel $ACCEL$ACCEL_PROPS"
> -command="$qemu -nodefaults $M $A -cpu $processor $chr_testdev $pci_testdev"
> -command+=" -display none -serial stdio"
> -command="$(migration_cmd) $(timeout_cmd) $command"
> -
> -if [ "$UEFI_SHELL_RUN" = "y" ]; then
> -	ENVIRON_DEFAULT=n run_test_status $command "$@"
> -elif [ "$EFI_USE_ACPI" = "y" ]; then
> -	run_test_status $command -kernel "$@"
> -else
> -	run_qemu $command -kernel "$@"
> -fi
> +case "$TARGET" in
> +qemu)
> +    arch_run_qemu "$@"
> +    ;;
> +kvmtool)
> +    arch_run_kvmtool "$@"
> +    ;;
> +esac
> -- 
> 2.47.1
> 
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
