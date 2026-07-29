Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A1D9C53200
	for <kvm-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 19:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=RU9XBsJXSvFav2Q5kTz2B/OqTSPPrBh5l7DFQ64Qw9M=; b=ZvBNynZ1e29Y4YHI89bLlzFIg/
	7usm4Wmest30DJ9ua9QG6dGb0qOdvnWLlEdM6blf3SPEIhhHoUU02rS9XlcKmwCCfNuqDirxdea21
	9HQfjZrxNIq3YCniKYD0RmYLjWqDZPfhq72I2O8l9kemJNFXLgHSQK1FnKbJXoGljLB+I7VMXFQkx
	WxyfIfrjRnpQKaMBXSHtzKN5Gwe6ay+zAuhBKem5OpPuZg/e1eekSrMK6z2OlIMy1jfz0d8o6t4cJ
	6uwBA7H0gCeGVW4PFygCjFN03RGXanuMtePsOaYW/XgK1azaVpzVMSqKAnYWzjfLbSEPuJ7RKhkpA
	kXtPhyGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpA7T-00000008uDR-2U1u;
	Wed, 29 Jul 2026 19:39:11 +0000
Received: from mail-pg1-x545.google.com ([2607:f8b0:4864:20::545])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpA7R-00000008uCq-06Sh
	for kvm-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 19:39:10 +0000
Received: by mail-pg1-x545.google.com with SMTP id 41be03b00d2f7-cb711c88f2eso877500a12.2
        for <kvm-riscv@lists.infradead.org>; Wed, 29 Jul 2026 12:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785353947; x=1785958747; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yz+Y4cDmmkJFalPabDMm+ynUXO0OUxXd4k3RBua3jcw=;
        b=EeAO6eoQXnuOKr4M94h1ze0XUymP1MjFCLamasFFRGpYbxqM203jLxREhp84AtVS9r
         LD6V+1DCoeusek6ZesdQRWYgp3SX2vB7g4v4jyg19gPKqddsn0EYJh3GbDp4lSoqe5Ld
         kOncdNqtKCds5EE/K3z6w3WXhfJun++WpfTgteWXLcl+4Q7Uxl0GfWi/iSLv7/nzDcsM
         7vmVmS6/6ZvrwmPiWlzEr0WlHyiH1SjDB7buzFw1DLr/MxZax6SjfUoUC9DKvrNF6F+a
         6FCXOchNSh9fiilak48BPo/DVh3anD5EYG3H8wmHUYYA7qPXUERgFl3b/Jq30tyDiN5D
         q1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785353947; x=1785958747;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yz+Y4cDmmkJFalPabDMm+ynUXO0OUxXd4k3RBua3jcw=;
        b=oTdn9J98b0nOgFprVAjx9Mwl/kSV7lXcHK0m/Dw4tki7OwSlUPdWBEg7IpHzoS1ezs
         7aztsaJw8TleO1JtnLhsoNNuOEaIE8qBvE9UTM6yY24RUtecDUJZPyP5e3EIFxuE1hii
         5GfC9ZsHVgC1MaFgFIhlEMJet6GT0+AtTuZ2jT4zdWEtFNEtOO5KGVWL6FTJU80ZBnhh
         s0Ldzlg+gLM5lVaqAOtsiUelqIb0WGmi26QuaPQ9f1WZNVH+ljUPljNqIj641dme0Qhp
         kihOIDYFj/awLX5eRKCBySFr4P1d50kF7trh5igbo0TyeykogajZsVin5CQ3MNS+Lh/s
         4mAg==
X-Forwarded-Encrypted: i=1; AHgh+Rqz9nQpUDzwAcM3lUAQeKbu8/zpriAdMFoHb6SmnbdmIEELreijbYhI8WqwwsqD0p3fWJYNJ6CH1Jg=@lists.infradead.org
X-Gm-Message-State: AOJu0YxLG0ys1Nl0JPBK/q6jEkeskFWUoNY5pcu39pSIQQzXPB+qYyaM
	JT6hucHq3y3SC0WRACwElTidOZfDCc/C2VgRlKxym0oXZtcA1TZWv8QVRdr159XM3g4vkNlOtWy
	NPOgewA==
X-Received: from pjbcn20.prod.google.com ([2002:a17:90a:f094:b0:38e:6163:aa2b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:37c7:b0:37f:f4ae:5f25
 with SMTP id 98e67ed59e1d1-38f99253d52mr179898a91.20.1785353947403; Wed, 29
 Jul 2026 12:39:07 -0700 (PDT)
Date: Wed, 29 Jul 2026 12:39:06 -0700
In-Reply-To: <20260331194202.1722082-4-vipinsh@google.com>
Mime-Version: 1.0
References: <20260331194202.1722082-1-vipinsh@google.com> <20260331194202.1722082-4-vipinsh@google.com>
Message-ID: <ampW2iHhp6EA21I5@google.com>
Subject: Re: [PATCH v4 3/9] KVM: selftests: Add timeout option in selftests runner
From: Sean Christopherson <seanjc@google.com>
To: Vipin Sharma <vipinsh@google.com>, t@google.com
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	pbonzini@redhat.com, borntraeger@linux.ibm.com, frankja@linux.ibm.com, 
	imbrenda@linux.ibm.com, anup@brainfault.org, atish.patra@linux.dev, 
	zhaotianrui@loongson.cn, maobibo@loongson.cn, chenhuacai@kernel.org, 
	maz@kernel.org, oliver.upton@linux.dev, ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_123909_104888_629F0F4D 
X-CRM114-Status: GOOD (  19.40  )
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

On Tue, Mar 31, 2026, Vipin Sharma wrote:
> Add a command line argument in KVM selftest runner to limit amount of
> time (seconds) given to a test for execution. Kill the test if it
> exceeds the given timeout. Define a new SelftestStatus.TIMED_OUT to
> denote a selftest final result. Add terminal color for status messages
> of timed out tests.
> 
> Set the default value of 120 seconds for all tests.
> 
> Signed-off-by: Vipin Sharma <vipinsh@google.com>
> ---
>  .../testing/selftests/kvm/runner/__main__.py  |  9 +++++-
>  .../testing/selftests/kvm/runner/selftest.py  | 29 ++++++++++++-------
>  .../selftests/kvm/runner/test_runner.py       |  2 +-
>  3 files changed, 27 insertions(+), 13 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/runner/__main__.py b/tools/testing/selftests/kvm/runner/__main__.py
> index 9b6c78e69c64..82c543d11c34 100644
> --- a/tools/testing/selftests/kvm/runner/__main__.py
> +++ b/tools/testing/selftests/kvm/runner/__main__.py
> @@ -37,6 +37,11 @@ def cli():
>                          default=".",
>                          help="Finds the test executables in the given path. Default is the current directory.")
>  
> +    parser.add_argument("--timeout",
> +                        default=120,
> +                        type=int,
> +                        help="Timeout, in seconds, before runner kills the running test. (Default: 120 seconds)")
> +
>      return parser.parse_args()
>  
>  
> @@ -44,6 +49,7 @@ def setup_logging():
>      class TerminalColorFormatter(logging.Formatter):
>          reset = "\033[0m"
>          red_bold = "\033[31;1m"
> +        red = "\033[31;1m"
>          green = "\033[32m"
>          yellow = "\033[33m"
>          blue = "\033[34m"
> @@ -52,7 +58,8 @@ def setup_logging():
>              SelftestStatus.PASSED: green,
>              SelftestStatus.NO_RUN: blue,
>              SelftestStatus.SKIPPED: yellow,
> -            SelftestStatus.FAILED: red_bold
> +            SelftestStatus.FAILED: red_bold,
> +            SelftestStatus.TIMED_OUT: red

Responding here because it's easier to see...

In my experience, uniquely identifying segfaults can be super helpful, e.g. (with
the stderr/stdout changes too).

diff --git a/tools/testing/selftests/kvm/runner/__main__.py b/tools/testing/selftests/kvm/runner/__main__.py
index 13f4cbea1fa7..93ce46e25caf 100644
--- a/tools/testing/selftests/kvm/runner/__main__.py
+++ b/tools/testing/selftests/kvm/runner/__main__.py
@@ -122,6 +122,7 @@ def setup_logging(args):
             SelftestStatus.NO_RUN: blue,
             SelftestStatus.SKIPPED: yellow,
             SelftestStatus.FAILED: red_bold,
+            SelftestStatus.SEGFAULT: red_bold,
             SelftestStatus.TIMED_OUT: red
         }
 
diff --git a/tools/testing/selftests/kvm/runner/selftest.py b/tools/testing/selftests/kvm/runner/selftest.py
index 76c3e6d463ee..9ccdeef62a3e 100644
--- a/tools/testing/selftests/kvm/runner/selftest.py
+++ b/tools/testing/selftests/kvm/runner/selftest.py
@@ -18,7 +18,8 @@ class SelftestStatus(enum.IntEnum):
     NO_RUN = 22
     SKIPPED = 23
     FAILED = 24
-    TIMED_OUT = 25
+    SEGFAULT = 25
+    TIMED_OUT = 26
 
     def __str__(self):
         return str.__str__(self.name)
@@ -63,6 +64,8 @@ class Selftest:
                 self.status = SelftestStatus.PASSED
             elif proc.returncode == 4:
                 self.status = SelftestStatus.SKIPPED
+            elif proc.returncode == 139:
+                self.state = SelftestStatus.SEGFAULT
             else:
                 self.status = SelftestStatus.FAILED
         except subprocess.TimeoutExpired as e:
diff --git a/tools/testing/selftests/kvm/runner/test_runner.py b/tools/testing/selftests/kvm/runner/test_runner.py
index 66a3c3711a8a..f06965c68520 100644
--- a/tools/testing/selftests/kvm/runner/test_runner.py
+++ b/tools/testing/selftests/kvm/runner/test_runner.py
@@ -21,6 +21,7 @@ class TestRunner:
         self.print_stds = {
             SelftestStatus.PASSED: args.print_passed,
             SelftestStatus.FAILED: args.print_failed,
+            SelftestStatus.SEGFAULT: args.print_failed,
             SelftestStatus.SKIPPED: args.print_skipped,
             SelftestStatus.TIMED_OUT: args.print_timed_out,
             SelftestStatus.NO_RUN: args.print_no_run
@@ -38,6 +39,7 @@ class TestRunner:
         print(f"\r\033[1mTotal: {self.tests_ran}/{len(self.tests)}" \
                 f"\033[32;1m Passed: {self.status[SelftestStatus.PASSED]}" \
                 f"\033[31;1m Failed: {self.status[SelftestStatus.FAILED]}" \
+                f"\033[31;1m Segfaults: {self.status[SelftestStatus.SEGFAULT]}" \
                 f"\033[33;1m Skipped: {self.status[SelftestStatus.SKIPPED]}"\
                 f"\033[91;1m Timed Out: {self.status[SelftestStatus.TIMED_OUT]}"\
                 f"\033[34;1m No Run: {self.status[SelftestStatus.NO_RUN]}\033[0m",
@@ -47,10 +49,14 @@ class TestRunner:
         print_level = self.print_stds.get(test_result.status, "full")
 
         print("\033[2K", end="\r", flush=True)
-        if (print_level == "full" or print_level == "stdout"):
+        if (print_level == "full"):
             logger.info("*** stdout ***\n" + test_result.stdout)
-        if (print_level == "full" or print_level == "stderr"):
             logger.info("*** stderr ***\n" + test_result.stderr)
+        elif (print_level == "stdout"):
+            logger.info(test_result.stdout)
+        elif (print_level == "stderr"):
+            logger.info(test_result.stderr)
+
         if (print_level != "off"):
             logger.log(test_result.status, f"[{test_result.status.name}] {test_result.test_path}")

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
