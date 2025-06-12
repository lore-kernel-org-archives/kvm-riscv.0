Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E89C71149
	for <kvm-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 19:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0PaAxCi9O3vimGRUwxKJ57rMxDFtAUrWHGo5N7dTz4s=; b=ZtMIf+YIf3IoOS
	3xLcjp+n4bEt1lTfPbbyIEK54kpB8ZjEYEyrqmAYUqjYnZaNhWswULUyzDHmth6uzAKIXmQVgxAYg
	Y5MvWSkPyvuzr6VnlcWFtPgReLEl3MBXZYlQO/uvVSNkG1xUaL0RabGmzfwP7dDC6L8YlYzA2B/lc
	H1zyk/JZmS4sj6b7Dq/2yRkt5k0DRWNrP6yoC3cWtlG0QcTwRiECIDDptHiQOs3tL3bhqaTFCInPV
	pF8wNHD1wPNRxFi+yu3VO8obkIvyoLZTpmCp25tPlgTJfidAKZCvKYboDSzi90AhDzivBV/wpj0LH
	kJwXB/sfTzi41OEyxDTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnoS-0000000EFuL-1SYG;
	Thu, 12 Jun 2025 19:42:12 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhx8-0000000DS2t-3DlS
	for kvm-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 13:26:47 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3ddf2993103so3613645ab.3
        for <kvm-riscv@lists.infradead.org>; Thu, 12 Jun 2025 06:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1749734806; x=1750339606; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2eN3swV8AIIuWWlJ3gYBwChYsvkIrC7SYyJzazn/BSI=;
        b=xwKLbet28ZIObFYEPo7VA7ZzeZwdVXsx8tbZaFwelwjkPVHVpo6fOpqqbA/K0c0STZ
         JtCt0j961G6tzvE3h4s9eghOGZMUv4iLHSJNAeOcY2kY83WbExEsmgYrtgweKpw3VEhU
         mthwT0avceUTNzAIzPMYnSjYojZcu2DSzc4tWc3NV1w85L1O4BI2fiLXhKLMxK7ORGhu
         pZ/UorMKT+TqKi3MnjcwoU3KUznxUSDadrpxndH9og6R+yNiONiXOGaPEVf9PayIY9Ik
         OC3dBx7fX77TUUXcjz9Q2I8B4jHgfCWb2/oFU9cVaQer4Pz/xhIjCjaRsYvC5a7hBDMX
         CQFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734806; x=1750339606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2eN3swV8AIIuWWlJ3gYBwChYsvkIrC7SYyJzazn/BSI=;
        b=oPhX/wXBoq7lbuyMJ69JEtCT4udCIYN//f6WntE7KyfG/orQVPofiUGsGe9eA6h605
         4ZWmgHfdygoGC9v2Mnb31IZQcpAH9V4TWgXTdSSOMrnKBl7imWV8+D69hNRULxjKpt8Y
         ycxb6RUbxNvaSSPjW4NEWPBFa8rzROYnPstCWRPIuTszW7nzkoLXeqnITZvOYr5W0Yi3
         qOKwA5jnZ2A66oHVuZFzh7iadX1Igj4OlalogbFlcKcrJw1hA5BXA0BbGwVpgPYnf/tP
         57980aTI9GsIZIDY7/A5k71nnV9LKWzVGmAckLYv2rVGHGI24TQaUHRGDjuFUKv+p215
         q5cg==
X-Forwarded-Encrypted: i=1; AJvYcCVSFiyg0t203D4DzTM0rMRqiQrTzIf4WftlyD7mFrlWs8eoH4H5jd2wPJj/cxXoZw8t68tBNXyAC6c=@lists.infradead.org
X-Gm-Message-State: AOJu0YziUVIojX/jKDrHv/UgxUnKnlRy4coOrp7e3p+PVwlp3ONoLcTo
	f8zuW+eWrTcOMVSg5AryQsngxEkOaW0lAmWqiHET2/3z2ACv7R0iZbib3WIrHvmvrXXuseSNprV
	UJnxRSkNnfTNLxaCM8XqFGzXDMSSTevHjMUGzXhubww==
X-Gm-Gg: ASbGncszHIl0dzW6sRozlS43vY1zfMoqIQnUpClxBOz9WxYThcGgdX85kM9D4mHXWMM
	mvICPQdlACN3Sm54EgpfrHNyIs2AN7p1LbTMiYDiLQYEa8rjrTCc+bXW924aMGS4AFUGkfRJDIf
	CEEVcnVeUAg9ISzz2EgXcocbqVGS/pM98pxTl6ZmF0IAzg
X-Google-Smtp-Source: AGHT+IG2iBZqXBZpblYqqV1CfizkbcXBVYuUqCYGloOAj0H2lvAJwOXwnS5XNnZkQ46BncD7OmhOhE+Hobvx1RtA1UQ=
X-Received: by 2002:a05:6e02:1807:b0:3dd:8663:d182 with SMTP id
 e9e14a558f8ab-3ddf42c5b4dmr72461125ab.13.1749734805782; Thu, 12 Jun 2025
 06:26:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250523101932.1594077-1-cleger@rivosinc.com> <20250523101932.1594077-15-cleger@rivosinc.com>
In-Reply-To: <20250523101932.1594077-15-cleger@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 12 Jun 2025 18:56:33 +0530
X-Gm-Features: AX0GCFtHBaD1dkadFboJHCaCDko1UoltJB37LuW30sdZ0j57mmaziXXBSUbao7Y
Message-ID: <CAAhSdy1qnRYOh0ka4PeJDf5ybviMrf+bpYaOOka3BXVmwAPSoQ@mail.gmail.com>
Subject: Re: [PATCH v8 14/14] RISC-V: KVM: add support for SBI_FWFT_MISALIGNED_DELEG
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Deepak Gupta <debug@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_062646_812938_D255F1DF 
X-CRM114-Status: GOOD (  17.82  )
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

T24gRnJpLCBNYXkgMjMsIDIwMjUgYXQgMzo1M+KAr1BNIENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBTQklfRldGVF9NSVNBTElHTkVEX0RFTEVHIG5lZWRz
IGhlZGVsZWcgdG8gYmUgbW9kaWZpZWQgdG8gZGVsZWdhdGUKPiBtaXNhbGlnbmVkIGxvYWQvc3Rv
cmUgZXhjZXB0aW9ucy4gU2F2ZSBhbmQgcmVzdG9yZSBpdCBkdXJpbmcgQ1BVCj4gbG9hZC9wdXQu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+
Cj4gUmV2aWV3ZWQtYnk6IERlZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPgo+IFJldmll
d2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+IFJldmlld2Vk
LWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KClF1ZXVlZCB0aGlzIHBhdGNo
IGZvciBMaW51eC02LjE3CgpUaGFua3MsCkFudXAKCj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3Zj
cHVfc2JpX2Z3ZnQuYyB8IDQxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAg
MSBmaWxlIGNoYW5nZWQsIDQxIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMK
PiBpbmRleCBiMGY2NmM3YmYwMTAuLjY3NzBjMDQzYmJjYiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jp
c2N2L2t2bS92Y3B1X3NiaV9md2Z0LmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaV9m
d2Z0LmMKPiBAQCAtMTQsNiArMTQsOCBAQAo+ICAjaW5jbHVkZSA8YXNtL2t2bV92Y3B1X3NiaS5o
Pgo+ICAjaW5jbHVkZSA8YXNtL2t2bV92Y3B1X3NiaV9md2Z0Lmg+Cj4KPiArI2RlZmluZSBNSVNf
REVMRUcgKEJJVF9VTEwoRVhDX0xPQURfTUlTQUxJR05FRCkgfCBCSVRfVUxMKEVYQ19TVE9SRV9N
SVNBTElHTkVEKSkKPiArCj4gIHN0cnVjdCBrdm1fc2JpX2Z3ZnRfZmVhdHVyZSB7Cj4gICAgICAg
ICAvKioKPiAgICAgICAgICAqIEBpZDogRmVhdHVyZSBJRAo+IEBAIC02OCw3ICs3MCw0NiBAQCBz
dGF0aWMgYm9vbCBrdm1fZndmdF9pc19kZWZpbmVkX2ZlYXR1cmUoZW51bSBzYmlfZndmdF9mZWF0
dXJlX3QgZmVhdHVyZSkKPiAgICAgICAgIHJldHVybiBmYWxzZTsKPiAgfQo+Cj4gK3N0YXRpYyBi
b29sIGt2bV9zYmlfZndmdF9taXNhbGlnbmVkX2RlbGVnYXRpb25fc3VwcG9ydGVkKHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSkKPiArewo+ICsgICAgICAgcmV0dXJuIG1pc2FsaWduZWRfdHJhcHNfY2Fu
X2RlbGVnYXRlKCk7Cj4gK30KPiArCj4gK3N0YXRpYyBsb25nIGt2bV9zYmlfZndmdF9zZXRfbWlz
YWxpZ25lZF9kZWxlZ2F0aW9uKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGt2bV9zYmlfZndmdF9jb25maWcgKmNv
bmYsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxv
bmcgdmFsdWUpCj4gK3sKPiArICAgICAgIHN0cnVjdCBrdm1fdmNwdV9jb25maWcgKmNmZyA9ICZ2
Y3B1LT5hcmNoLmNmZzsKPiArCj4gKyAgICAgICBpZiAodmFsdWUgPT0gMSkgewo+ICsgICAgICAg
ICAgICAgICBjZmctPmhlZGVsZWcgfD0gTUlTX0RFTEVHOwo+ICsgICAgICAgICAgICAgICBjc3Jf
c2V0KENTUl9IRURFTEVHLCBNSVNfREVMRUcpOwo+ICsgICAgICAgfSBlbHNlIGlmICh2YWx1ZSA9
PSAwKSB7Cj4gKyAgICAgICAgICAgICAgIGNmZy0+aGVkZWxlZyAmPSB+TUlTX0RFTEVHOwo+ICsg
ICAgICAgICAgICAgICBjc3JfY2xlYXIoQ1NSX0hFREVMRUcsIE1JU19ERUxFRyk7Cj4gKyAgICAg
ICB9IGVsc2Ugewo+ICsgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VSUl9JTlZBTElEX1BBUkFN
Owo+ICsgICAgICAgfQo+ICsKPiArICAgICAgIHJldHVybiBTQklfU1VDQ0VTUzsKPiArfQo+ICsK
PiArc3RhdGljIGxvbmcga3ZtX3NiaV9md2Z0X2dldF9taXNhbGlnbmVkX2RlbGVnYXRpb24oc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzdHJ1Y3Qga3ZtX3NiaV9md2Z0X2NvbmZpZyAqY29uZiwKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyAqdmFsdWUpCj4gK3sKPiArICAg
ICAgICp2YWx1ZSA9IChjc3JfcmVhZChDU1JfSEVERUxFRykgJiBNSVNfREVMRUcpID09IE1JU19E
RUxFRzsKPiArCj4gKyAgICAgICByZXR1cm4gU0JJX1NVQ0NFU1M7Cj4gK30KPiArCj4gIHN0YXRp
YyBjb25zdCBzdHJ1Y3Qga3ZtX3NiaV9md2Z0X2ZlYXR1cmUgZmVhdHVyZXNbXSA9IHsKPiArICAg
ICAgIHsKPiArICAgICAgICAgICAgICAgLmlkID0gU0JJX0ZXRlRfTUlTQUxJR05FRF9FWENfREVM
RUcsCj4gKyAgICAgICAgICAgICAgIC5zdXBwb3J0ZWQgPSBrdm1fc2JpX2Z3ZnRfbWlzYWxpZ25l
ZF9kZWxlZ2F0aW9uX3N1cHBvcnRlZCwKPiArICAgICAgICAgICAgICAgLnNldCA9IGt2bV9zYmlf
ZndmdF9zZXRfbWlzYWxpZ25lZF9kZWxlZ2F0aW9uLAo+ICsgICAgICAgICAgICAgICAuZ2V0ID0g
a3ZtX3NiaV9md2Z0X2dldF9taXNhbGlnbmVkX2RlbGVnYXRpb24sCj4gKyAgICAgICB9LAo+ICB9
Owo+Cj4gIHN0YXRpYyBzdHJ1Y3Qga3ZtX3NiaV9md2Z0X2NvbmZpZyAqCj4gLS0KPiAyLjQ5LjAK
PgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
