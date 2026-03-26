Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F7E310A3D81
	for <kvm-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 12:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RM4keaF3mxOr+CdKSl38rn3EFrKvwuF4QmesPCaNN38=; b=rQ8lAxHClkvoy/
	HHnGcINvPIoJLFhan533qDo130C3WWW7duj09QWilNLXR+DVugj+P7YRKxQiDjtbIC2n1tulOtS8K
	0WY5AL5bQmUY3iaZzF6dXTwc6xwUgwkqg0eb2AVnK+HojfwmNwy7VkQigI2YNKe+YX9Tk+15pMqMg
	rLDGBUMA4awaV+wLzlIUV13HPHGfa5lTaq6O4SeC15pkGS3ce5g+1ZlYN4GRYluMxtYFPJvO8CUek
	+0q8zB+9gMBoAJMkQCq27JDGQml583hohS9ZjVo13zRNKf/ecFOCzbO0f8EU0aC6wThHV2w87c/GH
	1cxlBNzv+TDTYDVgDQAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5jtC-00000005Rlt-3PtB;
	Thu, 26 Mar 2026 12:32:42 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5jt9-00000005Rka-2v5u
	for kvm-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 12:32:41 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-7d7f09aa39fso1052543a34.0
        for <kvm-riscv@lists.infradead.org>; Thu, 26 Mar 2026 05:32:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774528358; cv=none;
        d=google.com; s=arc-20240605;
        b=iugvBiXlJ1hns28wb81gTKd2UA4lpLZOuu/toyeWv2EYmZz5mDFa6zJtPiHsLB847e
         BXT0QMIawvWpqDRGgJiWiyOfUiOPbU7nuXYtUYiigKL+xtdt+I4Ddg9yZr3mXVCBKsBn
         yd21LVZ4EePvr/WKJ2GHBoGEIrITRZMSpICExpKkg4v3n0hg+O/XKa8Zt0G2oZ77zo9O
         YSTsts1DtK/Z+Yoe9H8PlzI47rTUY1HilTmBXithJ8ko90pI3xntG0SlrevDuTfUKbCH
         /6yJ4hFemStKWo0tJtFK+5ryOrPOQqiN4Sbp+p5cFYIqX83HeiC3qPXFCn5cg/ByWCf3
         //lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s5A1++5OwfMTff2//26cMDXzML41vSjWdt7IxBVidyI=;
        fh=vUlzKAzE5uTJPRqbLpqe33ceYPKGrttTEdvfMBMuN/Q=;
        b=MAn1OAdD1wGdjQ4Sg4bMLmVMu1NqdnOI0IGQflRX9li3bhV8xc8d83c3K7mCtwXxUm
         QofT2nIBukVMW9okAIGqeS9DAH6WsPo39Rf8/b9KnL1aLiACefMKElMmxpMzb9YjXkMK
         cEJWxHQsqvVgrgqYqLab34uvByzEbkGw9ApSgCex3l/+AVlTEKOg40Lrnmv/l9AX43S6
         4uzXwMPVLiX5RTDaeteV8pvf0+lsMh0/1Qu1ydz7jNQiGDRr2b9mxllCy43hPfiUhXS1
         2F8/IDQhyxAIx0UPmsM/bN5k7kSmaFXgbTcabh+J64ahIUyoa9GZEwgPydDNo5733Wse
         e4jw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1774528358; x=1775133158; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s5A1++5OwfMTff2//26cMDXzML41vSjWdt7IxBVidyI=;
        b=V4fv+Emq4wOZcYOQe/jfFFVakJWaATLt5UmWwDT8yIZ1kj6qfB9bbc+NBrpZOehJTv
         1ZTboNNSIFDFWoK8aZG+hrXXKn1CHaM5CWRd1a+z8d8o2m4ty5HE0ARASzzNmxPTLBew
         +kEXiOCORIq1qH/RSuiD7ArlP/7GVvVWDJkYS9LD9o+D2DdFS311K4W6vjbHJl1gIvoN
         ZwYQjZFGCZUJPuFyKrVqARfA3oN2eOffFwGvM0YbrTYsa2PzRxDQBXP8d2NWLs3UKxaE
         PpHJuTDdHTpo1gWgqXvXPxC+ZbTSOUoEw7oAIBQnCElsp8HEqh4ZyaqNZ0ZxqesYr1bC
         6ATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774528358; x=1775133158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s5A1++5OwfMTff2//26cMDXzML41vSjWdt7IxBVidyI=;
        b=T6tl/nwKdHdbZUnYpDcre1/sBmeRY2O0z2cgCZRAmcn0THDf/buYuUYclL55zo/jwA
         j9/JrZBdtpirzAbOSAzyYHKw3NXIy7ix14M3BN0ToC1O+LZWCorfj7BEY1PtVnfH9YWR
         1Pzy2192TKqe+khhAa+aVriQDWb+0pB4nOR2k3Iwg92SPGWb6QeCs+9Ej/pftqGetGFj
         GgBQDPATK4svh91Q79wyMXjhfmoO1jTzcp8LU/nPsb4mrc+54DFfPVcZGhAnui9wH3dK
         OY5XNEJmy83WbxtDKDWMqGZE/2fwaDHNzX1CWttlIh8ZbFB58dda8pwBWvsSnqyA5Qdy
         zf+w==
X-Forwarded-Encrypted: i=1; AJvYcCVMBwgkqoI1RQJdL0ZKuus3ISYKKd5qlYO+P1cJA3OdWX9ETn6BD3t0SScjV6ZVe2qqQ3hc25P5bZ0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyvEVXjAECSbT3DtWWRDl8hdDBV5Gx0v5+WA2epT1g3l8hq/0dz
	53siN4ZDu/G/lPAK4GenDB6Qj0XyPmjws/AnHykX1x2kQlDP2tRC3JWNVOT0Gmv7JQSLEY647YR
	K3ZQ3RvmD9lx0Tp9OM37Tfqt5aoZke5SZyYMmIA2fNw==
X-Gm-Gg: ATEYQzyVKWvOD0ptGEthSgzd30vUonfZdiGbw+gjRLlCE4S7SP1NY2dW/cAGzGOkNCc
	SWKFfftVAVw3iBh4JnHcNCPsflYZUHTtgXgpSoBWwHFsl12QsjUk9Hf/WqDXnV6/8xqZg5v1tiA
	YcbssJ3aNpJEjg9gR7yXEwGgBttgcX7YKeBjrtQiFL+qLB+Ct9K59kpbF5kz9E3dy/yF8YgsADw
	wwBTII+ekejGpOQwBIzIxLE4F6S2Ah0wGvZau6noNS9dIIN8IQU3Ur2VXiz9cZY93OMbWRdAwCp
	5ciEa8oRCTGNOmnxb6gc+V7hLdeigUPR/XYrZkO7hWdnUq1AsHSGoWoemRw8pzFpetd0bZt9jwm
	Fh8qMHvsQS6He12rUAkZ/BAWA1bc=
X-Received: by 2002:a4a:edcd:0:b0:67d:e836:2e32 with SMTP id
 006d021491bc7-67dff511512mr3387545eaf.35.1774528358402; Thu, 26 Mar 2026
 05:32:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260204134507.33912-1-fangyu.yu@linux.alibaba.com> <20260204134507.33912-3-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260204134507.33912-3-fangyu.yu@linux.alibaba.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 26 Mar 2026 18:02:26 +0530
X-Gm-Features: AQROBzBjp1ya48QrrJubnKGHIPLce4xzbTMR8-Rif6cPLDOdnUusNCgeyKu5kPs
Message-ID: <CAAhSdy2uMY+-9W34G3QJ3m9XWg2dq_PeNB_9j9B3viZaRg=SUQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] RISC-V: KVM: Detect and expose supported HGATP
 G-stage modes
To: fangyu.yu@linux.alibaba.com
Cc: pbonzini@redhat.com, corbet@lwn.net, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, guoren@kernel.org, 
	radim.krcmar@oss.qualcomm.com, andrew.jones@oss.qualcomm.com, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_053239_737973_260F64D0 
X-CRM114-Status: GOOD (  20.85  )
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

T24gV2VkLCBGZWIgNCwgMjAyNiBhdCA3OjE14oCvUE0gPGZhbmd5dS55dUBsaW51eC5hbGliYWJh
LmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBGYW5neXUgWXUgPGZhbmd5dS55dUBsaW51eC5hbGliYWJh
LmNvbT4KPgo+IEV4dGVuZCBrdm1fcmlzY3ZfZ3N0YWdlX21vZGVfZGV0ZWN0KCkgdG8gcHJvYmUg
YWxsIEhHQVRQLk1PREUgdmFsdWVzCj4gc3VwcG9ydGVkIGJ5IHRoZSBob3N0IGFuZCByZWNvcmQg
dGhlbSBpbiBhIGJpdG1hc2suIEtlZXAgdHJhY2tpbmcgdGhlCj4gbWF4aW11bSBzdXBwb3J0ZWQg
Ry1zdGFnZSBwYWdlIHRhYmxlIGxldmVsIGZvciBleGlzdGluZyBpbnRlcm5hbCB1c2Vycy4KPgo+
IEFsc28gcHJvdmlkZSBsaWdodHdlaWdodCBoZWxwZXJzIHRvIHJldHJpZXZlIHRoZSBzdXBwb3J0
ZWQtbW9kZSBiaXRtYXNrCj4gYW5kIHZhbGlkYXRlIGEgcmVxdWVzdGVkIEhHQVRQLk1PREUgYWdh
aW5zdCBpdC4KPgo+IFNpZ25lZC1vZmYtYnk6IEZhbmd5dSBZdSA8ZmFuZ3l1Lnl1QGxpbnV4LmFs
aWJhYmEuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9nc3RhZ2UuaCB8
IDExICsrKysrKysrCj4gIGFyY2gvcmlzY3Yva3ZtL2dzdGFnZS5jICAgICAgICAgICAgIHwgNDMg
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNl
cnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2t2bV9nc3RhZ2UuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2dzdGFn
ZS5oCj4gaW5kZXggYjEyNjA1ZmJjYTQ0Li43NmMzN2I1ZGMwMmQgMTAwNjQ0Cj4gLS0tIGEvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fZ3N0YWdlLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2t2bV9nc3RhZ2UuaAo+IEBAIC0zMCw2ICszMCw3IEBAIHN0cnVjdCBrdm1fZ3N0YWdl
X21hcHBpbmcgewo+ICAjZW5kaWYKPgo+ICBleHRlcm4gdW5zaWduZWQgbG9uZyBrdm1fcmlzY3Zf
Z3N0YWdlX21heF9wZ2RfbGV2ZWxzOwo+ICtleHRlcm4gdTMyIGt2bV9yaXNjdl9nc3RhZ2VfbW9k
ZV9tYXNrOwoKcy91MzIvdW5zaWduZWQgbG9uZy8Kcy9rdm1fcmlzY3ZfZ3N0YWdlX21vZGVfbWFz
ay9rdm1fcmlzY3ZfZ3N0YWdlX3N1cHBvcnRlZF9tb2RlX21hc2svCgo+Cj4gICNkZWZpbmUga3Zt
X3Jpc2N2X2dzdGFnZV9wZ2RfeGJpdHMgICAgIDIKPiAgI2RlZmluZSBrdm1fcmlzY3ZfZ3N0YWdl
X3BnZF9zaXplICAgICAgKDFVTCA8PCAoSEdBVFBfUEFHRV9TSElGVCArIGt2bV9yaXNjdl9nc3Rh
Z2VfcGdkX3hiaXRzKSkKPiBAQCAtNzUsNCArNzYsMTQgQEAgdm9pZCBrdm1fcmlzY3ZfZ3N0YWdl
X3dwX3JhbmdlKHN0cnVjdCBrdm1fZ3N0YWdlICpnc3RhZ2UsIGdwYV90IHN0YXJ0LCBncGFfdCBl
bmQKPgo+ICB2b2lkIGt2bV9yaXNjdl9nc3RhZ2VfbW9kZV9kZXRlY3Qodm9pZCk7Cj4KPiArc3Rh
dGljIGlubGluZSB1MzIga3ZtX3Jpc2N2X2dldF9oZ2F0cF9tb2RlX21hc2sodm9pZCkKPiArewo+
ICsgICAgICAgcmV0dXJuIGt2bV9yaXNjdl9nc3RhZ2VfbW9kZV9tYXNrOwo+ICt9Cj4gKwo+ICtz
dGF0aWMgaW5saW5lIGJvb2wga3ZtX3Jpc2N2X2hnYXRwX21vZGVfaXNfdmFsaWQodW5zaWduZWQg
bG9uZyBtb2RlKQo+ICt7Cj4gKyAgICAgICByZXR1cm4ga3ZtX3Jpc2N2X2dzdGFnZV9tb2RlX21h
c2sgJiBCSVQobW9kZSk7Cj4gK30KPiArCj4gICNlbmRpZgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jp
c2N2L2t2bS9nc3RhZ2UuYyBiL2FyY2gvcmlzY3Yva3ZtL2dzdGFnZS5jCj4gaW5kZXggMmQwMDQ1
ZjUwMmQxLi4zMjhkNDEzOGYxNjIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vZ3N0YWdl
LmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS9nc3RhZ2UuYwo+IEBAIC0xNiw2ICsxNiw4IEBAIHVu
c2lnbmVkIGxvbmcga3ZtX3Jpc2N2X2dzdGFnZV9tYXhfcGdkX2xldmVscyBfX3JvX2FmdGVyX2lu
aXQgPSAzOwo+ICAjZWxzZQo+ICB1bnNpZ25lZCBsb25nIGt2bV9yaXNjdl9nc3RhZ2VfbWF4X3Bn
ZF9sZXZlbHMgX19yb19hZnRlcl9pbml0ID0gMjsKPiAgI2VuZGlmCj4gKy8qIEJpdG1hc2sgb2Yg
c3VwcG9ydGVkIEhHQVRQLk1PREUgZW5jb2RpbmdzIChCSVQoSEdBVFBfTU9ERV8qKSkuICovCj4g
K3UzMiBrdm1fcmlzY3ZfZ3N0YWdlX21vZGVfbWFzayBfX3JvX2FmdGVyX2luaXQ7Cj4KPiAgI2Rl
ZmluZSBnc3RhZ2VfcHRlX2xlYWYoX19wdGVwKSAgICAgICAgXAo+ICAgICAgICAgKHB0ZV92YWwo
KihfX3B0ZXApKSAmIChfUEFHRV9SRUFEIHwgX1BBR0VfV1JJVEUgfCBfUEFHRV9FWEVDKSkKPiBA
QCAtMzE1LDQyICszMTcsNDMgQEAgdm9pZCBrdm1fcmlzY3ZfZ3N0YWdlX3dwX3JhbmdlKHN0cnVj
dCBrdm1fZ3N0YWdlICpnc3RhZ2UsIGdwYV90IHN0YXJ0LCBncGFfdCBlbmQKPiAgICAgICAgIH0K
PiAgfQo+Cj4gK3N0YXRpYyBib29sIF9faW5pdCBrdm1fcmlzY3ZfaGdhdHBfbW9kZV9zdXBwb3J0
ZWQodW5zaWduZWQgbG9uZyBtb2RlKQo+ICt7Cj4gKyAgICAgICBjc3Jfd3JpdGUoQ1NSX0hHQVRQ
LCBtb2RlIDw8IEhHQVRQX01PREVfU0hJRlQpOwo+ICsgICAgICAgcmV0dXJuICgoY3NyX3JlYWQo
Q1NSX0hHQVRQKSA+PiBIR0FUUF9NT0RFX1NISUZUKSA9PSBtb2RlKTsKPiArfQo+ICsKPiAgdm9p
ZCBfX2luaXQga3ZtX3Jpc2N2X2dzdGFnZV9tb2RlX2RldGVjdCh2b2lkKQo+ICB7Cj4gKyAgICAg
ICBrdm1fcmlzY3ZfZ3N0YWdlX21vZGVfbWFzayA9IDA7Cj4gKyAgICAgICBrdm1fcmlzY3ZfZ3N0
YWdlX21heF9wZ2RfbGV2ZWxzID0gMDsKPiArCj4gICNpZmRlZiBDT05GSUdfNjRCSVQKPiAtICAg
ICAgIC8qIFRyeSBTdjU3eDQgRy1zdGFnZSBtb2RlICovCj4gLSAgICAgICBjc3Jfd3JpdGUoQ1NS
X0hHQVRQLCBIR0FUUF9NT0RFX1NWNTdYNCA8PCBIR0FUUF9NT0RFX1NISUZUKTsKPiAtICAgICAg
IGlmICgoY3NyX3JlYWQoQ1NSX0hHQVRQKSA+PiBIR0FUUF9NT0RFX1NISUZUKSA9PSBIR0FUUF9N
T0RFX1NWNTdYNCkgewo+IC0gICAgICAgICAgICAgICBrdm1fcmlzY3ZfZ3N0YWdlX21heF9wZ2Rf
bGV2ZWxzID0gNTsKPiAtICAgICAgICAgICAgICAgZ290byBkb25lOwo+ICsgICAgICAgLyogVHJ5
IFN2Mzl4NCBHLXN0YWdlIG1vZGUgKi8KPiArICAgICAgIGlmIChrdm1fcmlzY3ZfaGdhdHBfbW9k
ZV9zdXBwb3J0ZWQoSEdBVFBfTU9ERV9TVjM5WDQpKSB7Cj4gKyAgICAgICAgICAgICAgIGt2bV9y
aXNjdl9nc3RhZ2VfbW9kZV9tYXNrIHw9IEJJVChIR0FUUF9NT0RFX1NWMzlYNCk7Cj4gKyAgICAg
ICAgICAgICAgIGt2bV9yaXNjdl9nc3RhZ2VfbWF4X3BnZF9sZXZlbHMgPSAzOwo+ICAgICAgICAg
fQo+Cj4gICAgICAgICAvKiBUcnkgU3Y0OHg0IEctc3RhZ2UgbW9kZSAqLwo+IC0gICAgICAgY3Ny
X3dyaXRlKENTUl9IR0FUUCwgSEdBVFBfTU9ERV9TVjQ4WDQgPDwgSEdBVFBfTU9ERV9TSElGVCk7
Cj4gLSAgICAgICBpZiAoKGNzcl9yZWFkKENTUl9IR0FUUCkgPj4gSEdBVFBfTU9ERV9TSElGVCkg
PT0gSEdBVFBfTU9ERV9TVjQ4WDQpIHsKPiArICAgICAgIGlmIChrdm1fcmlzY3ZfaGdhdHBfbW9k
ZV9zdXBwb3J0ZWQoSEdBVFBfTU9ERV9TVjQ4WDQpKSB7Cj4gKyAgICAgICAgICAgICAgIGt2bV9y
aXNjdl9nc3RhZ2VfbW9kZV9tYXNrIHw9IEJJVChIR0FUUF9NT0RFX1NWNDhYNCk7Cj4gICAgICAg
ICAgICAgICAgIGt2bV9yaXNjdl9nc3RhZ2VfbWF4X3BnZF9sZXZlbHMgPSA0Owo+IC0gICAgICAg
ICAgICAgICBnb3RvIGRvbmU7Cj4gICAgICAgICB9Cj4KPiAtICAgICAgIC8qIFRyeSBTdjM5eDQg
Ry1zdGFnZSBtb2RlICovCj4gLSAgICAgICBjc3Jfd3JpdGUoQ1NSX0hHQVRQLCBIR0FUUF9NT0RF
X1NWMzlYNCA8PCBIR0FUUF9NT0RFX1NISUZUKTsKPiAtICAgICAgIGlmICgoY3NyX3JlYWQoQ1NS
X0hHQVRQKSA+PiBIR0FUUF9NT0RFX1NISUZUKSA9PSBIR0FUUF9NT0RFX1NWMzlYNCkgewo+IC0g
ICAgICAgICAgICAgICBrdm1fcmlzY3ZfZ3N0YWdlX21heF9wZ2RfbGV2ZWxzID0gMzsKPiAtICAg
ICAgICAgICAgICAgZ290byBkb25lOwo+ICsgICAgICAgLyogVHJ5IFN2NTd4NCBHLXN0YWdlIG1v
ZGUgKi8KPiArICAgICAgIGlmIChrdm1fcmlzY3ZfaGdhdHBfbW9kZV9zdXBwb3J0ZWQoSEdBVFBf
TU9ERV9TVjU3WDQpKSB7Cj4gKyAgICAgICAgICAgICAgIGt2bV9yaXNjdl9nc3RhZ2VfbW9kZV9t
YXNrIHw9IEJJVChIR0FUUF9NT0RFX1NWNTdYNCk7Cj4gKyAgICAgICAgICAgICAgIGt2bV9yaXNj
dl9nc3RhZ2VfbWF4X3BnZF9sZXZlbHMgPSA1Owo+ICAgICAgICAgfQo+ICAjZWxzZSAvKiBDT05G
SUdfMzJCSVQgKi8KPiAgICAgICAgIC8qIFRyeSBTdjMyeDQgRy1zdGFnZSBtb2RlICovCj4gLSAg
ICAgICBjc3Jfd3JpdGUoQ1NSX0hHQVRQLCBIR0FUUF9NT0RFX1NWMzJYNCA8PCBIR0FUUF9NT0RF
X1NISUZUKTsKPiAtICAgICAgIGlmICgoY3NyX3JlYWQoQ1NSX0hHQVRQKSA+PiBIR0FUUF9NT0RF
X1NISUZUKSA9PSBIR0FUUF9NT0RFX1NWMzJYNCkgewo+ICsgICAgICAgaWYgKGt2bV9yaXNjdl9o
Z2F0cF9tb2RlX3N1cHBvcnRlZChIR0FUUF9NT0RFX1NWMzJYNCkpIHsKPiArICAgICAgICAgICAg
ICAga3ZtX3Jpc2N2X2dzdGFnZV9tb2RlX21hc2sgfD0gQklUKEhHQVRQX01PREVfU1YzMlg0KTsK
PiAgICAgICAgICAgICAgICAga3ZtX3Jpc2N2X2dzdGFnZV9tYXhfcGdkX2xldmVscyA9IDI7Cj4g
LSAgICAgICAgICAgICAgIGdvdG8gZG9uZTsKPiAgICAgICAgIH0KPiAgI2VuZGlmCj4KPiAtICAg
ICAgIC8qIEtWTSBkZXBlbmRzIG9uICFIR0FUUF9NT0RFX09GRiAqLwo+IC0gICAgICAga3ZtX3Jp
c2N2X2dzdGFnZV9tYXhfcGdkX2xldmVscyA9IDA7Cj4gLQo+IC1kb25lOgoKSGVyZSBhcmUgc29t
ZSBzdGF0ZW1lbnRzIGZyb20gUklTQy1WIHByaXZpbGVnZSBzcGVjaWZpY2F0aW9uOgoiSW1wbGVt
ZW50YXRpb25zIHRoYXQgc3VwcG9ydCBTdjQ4IG11c3QgYWxzbyBzdXBwb3J0IFN2MzkuIgoiSW1w
bGVtZW50YXRpb25zIHRoYXQgc3VwcG9ydCBTdjU3IG11c3QgYWxzbyBzdXBwb3J0IFN2NDguIgoi
VGhlIGNvbnZlcnNpb24gb2YgYW4gU3YzMng0LCBTdjM5eDQsIFN2NDh4NCwgb3IgU3Y1N3g0IGd1
ZXN0IHBoeXNpY2FsCmFkZHJlc3MgaXMgYWNjb21wbGlzaGVkIHdpdGggdGhlCnNhbWUgYWxnb3Jp
dGhtIHVzZWQgZm9yIFN2MzIsIFN2MzksIFN2NDgsIG9yIFN2NTcsIGFzIHByZXNlbnRlZCBpbgpT
ZWN0aW9uIDEyLjMuMiwgZXhjZXB0IHRoYXQ6IgoiaGdhdHAgc3Vic3RpdHV0ZXMgZm9yIHRoZSB1
c3VhbCBzYXRwOyIKCkJhc2VkIG9uIGFib3ZlIGl0IGlzIGEgd2FzdGUgdG8gdHJ5IGVhY2ggYW5k
IGV2ZXJ5IG1vZGUuCkZvciBleGFtcGxlOiBpZiBtb2RlIFN2NDh4NCBpcyBzdXBwb3J0ZWQgdGhl
biBTdjM5eDQgaXMgYWxzbyBzdXBwb3J0ZWQuCgpSZWdhcmRzLApBbnVwCgotLSAKa3ZtLXJpc2N2
IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
