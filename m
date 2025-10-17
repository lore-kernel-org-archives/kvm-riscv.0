Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 833D4CCD199
	for <kvm-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 03:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r21CfynkjqgweETB7MInKZE9fUnlfUWXBemCDLzsiUs=; b=hW5NhoiBM2rW75
	WOhUbBKiiMxARreyyb0Rs/HW9wkigRRtkMGGB+t9GNytT4ky8omlJT62pu1b51NTRspN5Zq6ZIIXt
	/9tGzF1WzSv6gRz7DLLtJJ2e84kof+P6Ol9dscc+AB9RruymB60UqXZNfAHZHgNS0ac4IyWTMTRQr
	/TwpdCWCjqXPEo0n4TyZGI4jXygdnGjcxDACx296UtzLXQU5fSFdt5QA7MdB/n58WU0sJKv7QNSE7
	vyZ0oL9vsitwG5/ajr6jS7d101ZYxHUHqYk066s9V9thbz8ALogJh7/0RwN2/jqhLSNpE+KQWb27Q
	Dg0i9Ht5YjQSZxLXenLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9b4O-00000006SZg-0wbQ;
	Fri, 17 Oct 2025 03:23:56 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9b4M-00000006SYz-0CXq
	for kvm-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 03:23:55 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5818de29d15so1795210e87.2
        for <kvm-riscv@lists.infradead.org>; Thu, 16 Oct 2025 20:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760671431; x=1761276231; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zgJbpEilKc76eN6ORe40tn9wWSRIn1nbjUiD28It3k8=;
        b=k62ld7wEV7bgX42VBkl05DVboFQnW9x+qGtTyvJZDryg9jLW/9siXN+fZ7tkh7UfL5
         Mu1bO2eW0zkBxhTKEa3V8FQPfynOzhGwj5msnMbQuHuLHk6Y76YUCHUigLF+N14s1/XH
         xKm6u7jkse6ApyT/5O3qK4Rv2XSuqLITdNGulMkqfSrPWVxT1DqSkc0V7w1tb86pa/SV
         XQZRSAwgyvac4/vzif9BzdcOfp85VUeDFOxHQaqGnbcFpL1Wl+oRDNV6TuZNXQjjyWkE
         HQsPQrGPwI7AqdxqEi9WTk8Jpu+cqtyV0fjdFZH//4738YebsjGAiUQ1NvNozSr0Dwz+
         sjjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760671431; x=1761276231;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zgJbpEilKc76eN6ORe40tn9wWSRIn1nbjUiD28It3k8=;
        b=mb4cAD1zdGf35p/+aaalzhY4YfT6prCvLEsMUM/vyiCoXI6CfcjDLh54GE/8jQ29Wn
         fDizSGQF0WKUCB8mDaPzqlTjfLmyK5I5cmTGqIudnW+NQntG/SvmVhHtjKgYHcWgzkx7
         H6YrFhaF/Cof9jfj0JY1SisYxSZUHOnwUN+XfyThKI4Hvc7BSaOyx/XNS2BGfEed57Hu
         pbhYQhvcu0Fo5hBgFRKk5hDOWGizqBASdeb9OBpo5kp54qb85L6utjRmvmgvDllQySsX
         VrjDbyukuhnNFGQbSQOfujp6KiJw2Ph9ie9afTZK9j0YIpnVI5ObEagWn1tuZAKnp6cg
         /Ziw==
X-Forwarded-Encrypted: i=1; AJvYcCXqStHIrypyQZyL2C3McrNqbMQmkhaYm0nxb2m4HDYCMasLygwKjsAGxBgISySAXRJvsgI1Govk6X8=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywkdo000Ie0Qob4QLadGuW/cOvw5hPqhPjaSD3RN+MHM0hJo00+
	M8XDLlntGfUFtno943rQ8I7qJbyNH2RT/X1usla/N/4VsBstrysTldZwqw2mlNsWRy4Qi+vF+6R
	THnMPSJFTrRO9Ss4HE+dr7imILXPY1RyaocswCqt5NA==
X-Gm-Gg: ASbGncuXesQXCHj8GFgi3sKeceYmYO+as3j9W+Z98Mqeng5IT+auaM7rPUGE3M195yg
	I+dcuLwUGsiTMSsRVcrSTJziqWqxMlnJb3A/cikwez5UStyKmTn1UoWnBKzElSs2HeXd3ebpW/G
	wqOWfDP7rY75U7Y1cNfyspGkx65GL9/U9STbEC6QIdAu8dZlO+UvjwJD7DSG4XFWui+TgKFVrhg
	+YyC+ogRowQS96QZO15L/yA8PCfhfzZy9SnUvci9XuCYpeY3qDyh4tOG3uzvgXQNa+mL3OK
X-Google-Smtp-Source: AGHT+IElSKtdIpALk1nSLovdiSg+YYsyRQZSurzM1kakr9yrGs4N9sEcb79hjU8qjRKyDo4eqHVmU9r98WccWB5VKkE=
X-Received: by 2002:a05:6512:3f12:b0:577:9ee:7d57 with SMTP id
 2adb3069b0e04-591d85a2146mr785397e87.46.1760671431298; Thu, 16 Oct 2025
 20:23:51 -0700 (PDT)
MIME-Version: 1.0
References: <20251016001714.3889380-1-samuel.holland@sifive.com>
In-Reply-To: <20251016001714.3889380-1-samuel.holland@sifive.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 17 Oct 2025 08:53:39 +0530
X-Gm-Features: AS18NWAHiotLWgrvaFJ0yhxbbAeGChAh_woFA4Y002T2jSkQKffZFvzyYjf0LZs
Message-ID: <CAK9=C2W7-+UnWHZyTNkwTRy-=E5vjUNTjvq9PSCrLVZsY4b56g@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix check for local interrupts on riscv32
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_202354_086762_706DD3BE 
X-CRM114-Status: GOOD (  12.86  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBPY3QgMTYsIDIwMjUgYXQgNTo0N+KAr0FNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IFRvIHNldCBhbGwgNjQgYml0cyBpbiB0aGUg
bWFzayBvbiBhIDMyLWJpdCBzeXN0ZW0sIHRoZSBjb25zdGFudCBtdXN0Cj4gaGF2ZSB0eXBlIGB1
bnNpZ25lZCBsb25nIGxvbmdgLgo+Cj4gRml4ZXM6IDZiMWU4YmE0YmFjNCAoIlJJU0MtVjogS1ZN
OiBVc2UgYml0bWFwIGZvciBpcnFzX3BlbmRpbmcgYW5kIGlycXNfcGVuZGluZ19tYXNrIikKPiBT
aWduZWQtb2ZmLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4K
ClF1ZXVlZCB0aGlzIHBhdGNoIGZvciBMaW51eC02LjE4IGZpeGVzLgoKVGhhbmtzLApBbnVwCgo+
IC0tLQo+Cj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHUuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rdm0vdmNwdS5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gaW5kZXggYmNjYjkxOWNhNjE1
Li41Y2UzNWFiYTYwNjkgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gKysr
IGIvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gQEAgLTIxMiw3ICsyMTIsNyBAQCBpbnQga3ZtX2Nw
dV9oYXNfcGVuZGluZ190aW1lcihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCj4KPiAgaW50IGt2bV9h
cmNoX3ZjcHVfcnVubmFibGUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQo+ICB7Cj4gLSAgICAgICBy
ZXR1cm4gKGt2bV9yaXNjdl92Y3B1X2hhc19pbnRlcnJ1cHRzKHZjcHUsIC0xVUwpICYmCj4gKyAg
ICAgICByZXR1cm4gKGt2bV9yaXNjdl92Y3B1X2hhc19pbnRlcnJ1cHRzKHZjcHUsIC0xVUxMKSAm
Jgo+ICAgICAgICAgICAgICAgICAha3ZtX3Jpc2N2X3ZjcHVfc3RvcHBlZCh2Y3B1KSAmJiAhdmNw
dS0+YXJjaC5wYXVzZSk7Cj4gIH0KPgo+IC0tCj4gMi40Ny4yCj4KPiBiYXNlLWNvbW1pdDogNWE2
ZjY1ZDE1MDI1NTFmODRjMTU4Nzg5ZTVkODkyOTljNzg5MDdjNwo+IGJyYW5jaDogdXAva3ZtLWFp
YS1maXgKPgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0t
cmlzY3YK
