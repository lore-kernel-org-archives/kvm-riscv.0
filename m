Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C974BEBFD28
	for <kvm-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 09:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O+0uDLWyIXbvAy7BKeTO7mDR/jhsjlb9d7/1TPwDY7o=; b=ippksp98U1ZrTQ
	9QcxKGHHMhHncyxdO+CziYRdJcMf4Wd9nlnmWzL3zIlzzGD7tIOomXURr907Q3kD9K7gvV4frwGmO
	ueGlwZSDNRoPK1y1sgCchWilcVhiK5QH04Xjzd+JKmnVq0h1D5XyXudLpZowcCmuvxBgu5CnOGHG1
	lNjPc4PEt1oXph8CmYrSvCP1ss4isJ2FPqDDegaWBprT+CU+x90NhIQNWJeyVeCDtM3std36/+ET7
	Jh+jI9F0sy31YiMjvpdIefLMn+atceiyEcmkn0WzPB3XouU4oVILGRBEtJfRHzbBiiwDd8/GjgPrF
	3EZZkF0b30iMKMny4wvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCDpT-0000000FNz6-1NkA;
	Mon, 13 Apr 2026 09:43:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCDpS-0000000FNyi-0V0m
	for kvm-riscv@bombadil.infradead.org;
	Mon, 13 Apr 2026 09:43:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=up0W45gtoNI4pHs0kRq4cu9I3A/mCEQzypUKR4wYWZA=; b=JCV/x5ItJoBjCNBbaGXi7ySIi+
	P65jcA22ZB4kea2okiFYEzw1OX6ZPNbcSw/C103kbLljNUsokHrUg+MephxoaW4MO8KdgM3Uva83v
	H9m4gLuMwVMUI9x5Aq7QnIK8PE4S2ZnWv8HEEQlmKgPNVw/utVLXR25YdK2gxBRkCb3IT6Fju6B60
	3/Mcr2VDYkF+hzUqcQ5iYiAugPy+SOFCfN2sZBMadb1Poga2H4Tv7AVJ52rPSGJ/Qk5ZH0s+VlyBF
	2flZ+XkvxufhB0DhV0AAB2xkPlTZFxy9uomK3W+F0fqpJ2qYD+ZYyuCbVDc6HX5TAAO60NfW/u7ri
	JLfARq+Q==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCDpO-0000000GVye-2OUX
	for kvm-riscv@lists.infradead.org;
	Mon, 13 Apr 2026 09:43:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776073410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=up0W45gtoNI4pHs0kRq4cu9I3A/mCEQzypUKR4wYWZA=;
	b=cIhVQeTasdhwcQH9J403grL3SYWWKmaaprjL1Eu8PnObRz2UM+FO0MPQlTuBh07i6UzB0E
	475A9J3nHPZ9RyS5Kd3ygDnEKCYmwxR+TjkMgizBEYRamaclZr+Bo5lnjQlvTn0kKYVEMP
	7sMvfB46DO9wXj1t4dewTPFw3IyfrSI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776073410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=up0W45gtoNI4pHs0kRq4cu9I3A/mCEQzypUKR4wYWZA=;
	b=cIhVQeTasdhwcQH9J403grL3SYWWKmaaprjL1Eu8PnObRz2UM+FO0MPQlTuBh07i6UzB0E
	475A9J3nHPZ9RyS5Kd3ygDnEKCYmwxR+TjkMgizBEYRamaclZr+Bo5lnjQlvTn0kKYVEMP
	7sMvfB46DO9wXj1t4dewTPFw3IyfrSI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-134-a3vRW0jUN5Cte82KvilXWA-1; Mon, 13 Apr 2026 05:43:28 -0400
X-MC-Unique: a3vRW0jUN5Cte82KvilXWA-1
X-Mimecast-MFC-AGG-ID: a3vRW0jUN5Cte82KvilXWA_1776073407
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-43d70e3e4e7so1113676f8f.1
        for <kvm-riscv@lists.infradead.org>; Mon, 13 Apr 2026 02:43:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776073407; x=1776678207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=up0W45gtoNI4pHs0kRq4cu9I3A/mCEQzypUKR4wYWZA=;
        b=czZ0iXehWAmfW5A9bfylCXJabkZhK7TwBCsF8EpsbfMl79sLC9qR49EcIJE0cwArto
         hFIKOAxtuGYaMP8veJ64iIClFMRQOEVXJE5XPSbrl0ZoNZYpCXgNzY9PclX4SaPNBLVe
         Rm/sihX+f8YrOAk8a9ctFU59ETkKb9gfeqRuEmrMybuiAv2BSHZTLrpsXTd3kyxD7mxb
         sjUiPEhgiFqS7jWgeTI/0RGybSCnWa8PjHVYvXWbke1MygtiiIV9TmlG8+536d4XOzKh
         SZ4OYqQXkW6hPDSkLS5YkA3MDIiQ480yh7x8nSZLTKSp3C5gxRlnpv1zVfFapN5BLg2N
         PWdQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Lkm7+XBkwPjNJfc4e21DLpid95g/rs4Gzh0G4IcPBb13m5y/kdLAs28XcJsdnfWQPjCSyuJruamY=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywh3Pavw4R3FlkTe3EtajMRn1pit3GrbYCScl5pmJgKbm5CzNze
	8itENQwIndzgoQozfCD/e+KeKLL/JH7cTcsX2LwsvmWQ9xa9q3MwgTNFpml1iGUmZD++Fwchwas
	wUvjZ9hL8UfHAxdNc5DC3twCJo3QM42iHeS/oDGDmOsotby1Cbq8DVSVkAOPWNVKAfgoHmxlF1Y
	pWQ+Yx1KmyrXlIp9l0uAbHzc02drxlpbhSJchtvoJbvg==
X-Gm-Gg: AeBDieuCsVC0iiXE2/V0EYZM2DcH35NfZDYKBn+bk+GtagvoYrstfPotyj/oIS3w7gf
	7N7z6rHfzPK4YP8Skh65n7I11/IoGZf4AS5yZDh5H7477mj+5aTuVhyebqrwXPTQ7yXMX5q/hLi
	lzTWZDb7ZBGDnc88mPDTtwayNCV8hsaBwR6YplKLmXbiXFThIEhiQilVCl7r2ycD/lRAlXBROe7
	ojaHkcww7Vzit1FW/V+OBJq0cB+CdFyP30+9rS97hUTPhnxyBPFNCuFYTCpYIBNAfFf5LDzhJQv
	SsD9
X-Received: by 2002:a05:6000:2dc1:b0:43d:7af0:3a83 with SMTP id ffacd0b85a97d-43d7af03e3emr2720418f8f.41.1776073406806;
        Mon, 13 Apr 2026 02:43:26 -0700 (PDT)
X-Received: by 2002:a05:6000:2dc1:b0:43d:7af0:3a83 with SMTP id
 ffacd0b85a97d-43d7af03e3emr2720372f8f.41.1776073406289; Mon, 13 Apr 2026
 02:43:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy0sU997x67zZe00ZVPVrOT-=X8zOUk3OxWXeDcn-rHeXA@mail.gmail.com>
In-Reply-To: <CAAhSdy0sU997x67zZe00ZVPVrOT-=X8zOUk3OxWXeDcn-rHeXA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 13 Apr 2026 11:43:14 +0200
X-Gm-Features: AQROBzBQfjt3xV4dcP8Nj1D_N7gw5YuFZWv1XYE0RCatLaN8XwSCpf4fd4AGGbo
Message-ID: <CABgObfYosYD=xmLgxyDhL44yPvw06bB3ApaD6D4BRxte3tnPGQ@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 7.1
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Atish Patra <atish.patra@linux.dev>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2EUs0ItKfrTag5XZcAGT_635oI_oKiXj5gLhABu-Wbs_1776073407
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_104334_834956_A7E96CD4 
X-CRM114-Status: GOOD (  17.89  )
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

T24gU3VuLCBBcHIgMTIsIDIwMjYgYXQgMzoxNOKAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gSGkgUGFvbG8sCj4KPiBXZSBoYXZlIHRoZSBmb2xsb3dpbmcg
S1ZNIFJJU0MtViBjaGFuZ2VzIGZvciA3LjE6Cj4gMSkgRml4ZXMgZm9yIGlzc3VlcyBpbiBzdGVh
bCB0aW1lIGFjY291bnRpbmcsIHZlY3RvciBhbmQKPiAgICAgUE1VIHdoaWNoIHdlcmUgZGlzY292
ZXJlZCBieSBLVk0gQVBJIGZ1enppbmcKPiAyKSBTcGxpdCBodWdlIHBhZ2VzIGR1cmluZyBmYXVs
dCBoYW5kbGluZyBmb3IgZGlydHkgbG9nZ2luZwo+ICAgICBzbyB0aGF0IHdyaXRlIHBlcm1pc3Np
b24gaXMgcmVzdG9yZWQgZm9yIHNtYWxsZXIgcGFnZXMKPiAzKSBJbXByb3ZlIGt2bV9hcmNoX3Zj
cHVfbG9hZCgpIHBlcmZvcm1hbmNlIGJ5IHNraXBwaW5nCj4gICAgIENTUiByZXN0b3JlIGlmIFZD
UFUgaXMgcmVsb2FkZWQgb24gdGhlIHNhbWUgY29yZQo+IDQpIEltcGxlbWVudCBrdm1fYXJjaF9o
YXNfZGVmYXVsdF9pcnFjaGlwKCkgZm9yIEtWTSBzZWxmdGVzdHMKPiA1KSBTdXBwb3J0IGNvbmZp
Z3VyYXRpb24gb2YgcGVyLVZNIEhHQVRQIG1vZGUgZnJvbSBLVk0KPiAgICAgdXNlciBzcGFjZQo+
IDYpIFNvbWUgbW9yZSBwcmVwYXJhdG9yeSBjaGFuZ2VzIGZvciBuZXN0ZWQgdmlydHVhbGl6YXRp
b24KPiAgICAgc3VjaCBhczoKPiAgICAgNi4xKSBGYWN0b3JlZC1vdXQgSVNBIGNoZWNrcyBpbnRv
IHNlcGFyYXRlIHNvdXJjZXMKPiAgICAgNi4yKSBBZGRlZCBoaWRlbGVnIHRvIHN0cnVjdCBrdm1f
dmNwdV9jb25maWcKPiAgICAgNi4zKSBGYWN0b3JlZC1vdXQgVkNQVSBjb25maWcgaW50byBzZXBh
cmF0ZSBzb3VyY2VzCgpEb25lLCB0aGFua3MuCgpQYW9sbwoKPiBQbGVhc2UgcHVsbC4KPgo+IFJl
Z2FyZHMsCj4gQW51cAo+Cj4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCBjMzY5
Mjk5ODk1YTU5MWQ5Njc0NWQ2NDkyZDQ4ODgyNTliMDA0YTllOgo+Cj4gICBMaW51eCA3LjAtcmM1
ICgyMDI2LTAzLTIyIDE0OjQyOjE3IC0wNzAwKQo+Cj4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0
IHJlcG9zaXRvcnkgYXQ6Cj4KPiAgIGh0dHBzOi8vZ2l0aHViLmNvbS9rdm0tcmlzY3YvbGludXgu
Z2l0IHRhZ3Mva3ZtLXJpc2N2LTcuMS0xCj4KPiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAg
dG8gZGRiZjljNzZjNDAyMGJmNjNhMDc5OWIwMGZhYWQ0MGNhYTNkZTZjMjoKPgo+ICAgUklTQy1W
OiBLVk06IEZpeCBzaGlmdC1vdXQtb2YtYm91bmRzIGluIG1ha2VfeGZlbmNlX3JlcXVlc3QoKQo+
ICgyMDI2LTA0LTA2IDA5OjQzOjAyICswNTMwKQo+Cj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IEtWTS9yaXNjdiBjaGFu
Z2VzIGZvciA3LjEKPgo+ICAtIEZpeCBzdGVhbCB0aW1lIHNoYXJlZCBtZW1vcnkgYWxpZ25tZW50
IGNoZWNrcwo+ICAtIEZpeCB2ZWN0b3IgY29udGV4dCBhbGxvY2F0aW9uIGxlYWsKPiAgLSBGaXgg
YXJyYXkgb3V0LW9mLWJvdW5kcyBpbiBwbXVfY3RyX3JlYWQoKSBhbmQgcG11X2Z3X2N0cl9yZWFk
X2hpKCkKPiAgLSBGaXggZG91YmxlLWZyZWUgb2Ygc2RhdGEgaW4ga3ZtX3BtdV9jbGVhcl9zbmFw
c2hvdF9hcmVhKCkKPiAgLSBGaXggaW50ZWdlciBvdmVyZmxvdyBpbiBrdm1fcG11X3ZhbGlkYXRl
X2NvdW50ZXJfbWFzaygpCj4gIC0gRml4IHNoaWZ0LW91dC1vZi1ib3VuZHMgaW4gbWFrZV94ZmVu
Y2VfcmVxdWVzdCgpCj4gIC0gRml4IGxvc3Qgd3JpdGUgcHJvdGVjdGlvbiBvbiBodWdlIHBhZ2Vz
IGR1cmluZyBkaXJ0eSBsb2dnaW5nCj4gIC0gU3BsaXQgaHVnZSBwYWdlcyBkdXJpbmcgZmF1bHQg
aGFuZGxpbmcgZm9yIGRpcnR5IGxvZ2dpbmcKPiAgLSBTa2lwIENTUiByZXN0b3JlIGlmIFZDUFUg
aXMgcmVsb2FkZWQgb24gdGhlIHNhbWUgY29yZQo+ICAtIEltcGxlbWVudCBrdm1fYXJjaF9oYXNf
ZGVmYXVsdF9pcnFjaGlwKCkgZm9yIEtWTSBzZWxmdGVzdHMKPiAgLSBGYWN0b3JlZC1vdXQgSVNB
IGNoZWNrcyBpbnRvIHNlcGFyYXRlIHNvdXJjZXMKPiAgLSBBZGRlZCBoaWRlbGVnIHRvIHN0cnVj
dCBrdm1fdmNwdV9jb25maWcKPiAgLSBGYWN0b3JlZC1vdXQgVkNQVSBjb25maWcgaW50byBzZXBh
cmF0ZSBzb3VyY2VzCj4gIC0gU3VwcG9ydCBjb25maWd1cmF0aW9uIG9mIHBlci1WTSBIR0FUUCBt
b2RlIGZyb20gS1ZNIHVzZXIgc3BhY2UKPgo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiBBbnVwIFBhdGVsICg2KToKPiAg
ICAgICBSSVNDLVY6IEtWTTogSW50cm9kdWNlIGNvbW1vbiBrdm1fcmlzY3ZfaXNhX2NoZWNrX2hv
c3QoKQo+ICAgICAgIFJJU0MtVjogS1ZNOiBGYWN0b3Itb3V0IElTQSBjaGVja3MgaW50byBzZXBh
cmF0ZSBzb3VyY2VzCj4gICAgICAgUklTQy1WOiBLVk06IE1vdmUgdGltZXIgc3RhdGUgZGVmaW5l
cyBjbG9zZXIgdG8gc3RydWN0IGluIFVBUEkgaGVhZGVyCj4gICAgICAgUklTQy1WOiBLVk06IEFk
ZCBoaWRlbGVnIHRvIHN0cnVjdCBrdm1fdmNwdV9jb25maWcKPiAgICAgICBSSVNDLVY6IEtWTTog
RmFjdG9yLW91dCBWQ1BVIGNvbmZpZyBpbnRvIHNlcGFyYXRlIHNvdXJjZXMKPiAgICAgICBSSVND
LVY6IEtWTTogRG9uJ3QgY2hlY2sgaHN0YXRlZW4wIHdoZW4gdXBkYXRpbmcgc3N0YXRlZW4wIENT
Ugo+Cj4gRmFuZ3l1IFl1ICgzKToKPiAgICAgICBSSVNDLVY6IEtWTTogU3VwcG9ydCBydW50aW1l
IGNvbmZpZ3VyYXRpb24gZm9yIHBlci1WTSdzIEhHQVRQIG1vZGUKPiAgICAgICBSSVNDLVY6IEtW
TTogQ2FjaGUgZ3N0YWdlIHBnZF9sZXZlbHMgaW4gc3RydWN0IGt2bV9nc3RhZ2UKPiAgICAgICBS
SVNDLVY6IEtWTTogUmV1c2UgS1ZNX0NBUF9WTV9HUEFfQklUUyB0byBzZWxlY3QgSEdBVFAuTU9E
RQo+Cj4gSmlha2FpIFh1ICg4KToKPiAgICAgICBSSVNDLVY6IEtWTTogVmFsaWRhdGUgU0JJIFNU
QSBzaG1lbSBhbGlnbm1lbnQgaW4ga3ZtX3NiaV9leHRfc3RhX3NldF9yZWcoKQo+ICAgICAgIEtW
TTogc2VsZnRlc3RzOiBSZWZhY3RvciBVQVBJIHRlc3RzIGludG8gZGVkaWNhdGVkIGZ1bmN0aW9u
Cj4gICAgICAgUklTQy1WOiBLVk06IHNlbGZ0ZXN0czogQWRkIFJJU0MtViBTQkkgU1RBIHNobWVt
IGFsaWdubWVudCB0ZXN0cwo+ICAgICAgIFJJU0MtVjogS1ZNOiBGaXggYXJyYXkgb3V0LW9mLWJv
dW5kcyBpbiBwbXVfY3RyX3JlYWQoKSBhbmQKPiBwbXVfZndfY3RyX3JlYWRfaGkoKQo+ICAgICAg
IFJJU0MtVjogS1ZNOiBzZWxmdGVzdHM6IEZpeCBmaXJtd2FyZSBjb3VudGVyIHJlYWQgaW4gc2Jp
X3BtdV90ZXN0Cj4gICAgICAgUklTQy1WOiBLVk06IEZpeCBkb3VibGUtZnJlZSBvZiBzZGF0YSBp
biBrdm1fcG11X2NsZWFyX3NuYXBzaG90X2FyZWEoKQo+ICAgICAgIFJJU0MtVjogS1ZNOiBGaXgg
aW50ZWdlciBvdmVyZmxvdyBpbiBrdm1fcG11X3ZhbGlkYXRlX2NvdW50ZXJfbWFzaygpCj4gICAg
ICAgUklTQy1WOiBLVk06IEZpeCBzaGlmdC1vdXQtb2YtYm91bmRzIGluIG1ha2VfeGZlbmNlX3Jl
cXVlc3QoKQo+Cj4gSmlueXUgVGFuZyAoMSk6Cj4gICAgICAgS1ZNOiByaXNjdjogU2tpcCBDU1Ig
cmVzdG9yZSBpZiBWQ1BVIGlzIHJlbG9hZGVkIG9uIHRoZSBzYW1lIGNvcmUKPgo+IE1heXVyZXNo
IENoaXRhbGUgKDEpOgo+ICAgICAgIEtWTTogcmlzY3Y6IHNlbGZ0ZXN0czogSW1wbGVtZW50IGt2
bV9hcmNoX2hhc19kZWZhdWx0X2lycWNoaXAKPgo+IE9zYW1hIEFiZGVsa2FkZXIgKDIpOgo+ICAg
ICAgIFJJU0MtVjogS1ZNOiBmaXggUE1VIHNuYXBzaG90X3NldF9zaG1lbSBvbiAzMi1iaXQgaG9z
dHMKPiAgICAgICByaXNjdjoga3ZtOiBmaXggdmVjdG9yIGNvbnRleHQgYWxsb2NhdGlvbiBsZWFr
Cj4KPiBXYW5nIFllY2hhbyAoMik6Cj4gICAgICAgUklTQy1WOiBLVk06IEZpeCBsb3N0IHdyaXRl
IHByb3RlY3Rpb24gb24gaHVnZSBwYWdlcyBkdXJpbmcgZGlydHkgbG9nZ2luZwo+ICAgICAgIFJJ
U0MtVjogS1ZNOiBTcGxpdCBodWdlIHBhZ2VzIGR1cmluZyBmYXVsdCBoYW5kbGluZyBmb3IgZGly
dHkgbG9nZ2luZwo+Cj4gWXVmZW5nIFdhbmcgKDEpOgo+ICAgICAgIHJpc2N2OiBrdm06IGFkZCBu
dWxsIHBvaW50ZXIgY2hlY2sgZm9yIHZlY3RvciBkYXRhcAo+Cj4gIGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20va3ZtX2dzdGFnZS5oICAgICAgICAgICAgICAgIHwgIDUxICsrKy0KPiAgYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9rdm1faG9zdC5oICAgICAgICAgICAgICAgICAgfCAgMjMgKy0KPiAgYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faXNhLmggICAgICAgICAgICAgICAgICAgfCAgMjAgKysK
PiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fdmNwdV9jb25maWcuaCAgICAgICAgICAgfCAg
MjUgKysKPiAgYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oICAgICAgICAgICAgICAg
ICAgfCAgIDggKy0KPiAgYXJjaC9yaXNjdi9rdm0vTWFrZWZpbGUgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgIDIgKwo+ICBhcmNoL3Jpc2N2L2t2bS9haWFfZGV2aWNlLmMgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAgNCArLQo+ICBhcmNoL3Jpc2N2L2t2bS9nc3RhZ2UuYyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8IDE5OCArKysrKysrKysrKy0tLQo+ICBhcmNoL3Jpc2N2L2t2
bS9pc2EuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDI1MyArKysrKysrKysrKysr
KysrKysKPiAgYXJjaC9yaXNjdi9rdm0vbWFpbi5jICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMTYgKy0KPiAgYXJjaC9yaXNjdi9rdm0vbW11LmMgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgNzAgKystLS0KPiAgYXJjaC9yaXNjdi9rdm0vdGxiLmMgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgIDMgKy0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdS5jICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAxMTEgKysrLS0tLS0KPiAgYXJjaC9yaXNjdi9rdm0v
dmNwdV9jb25maWcuYyAgICAgICAgICAgICAgICAgICAgICAgfCAxMDMgKysrKysrKysKPiAgYXJj
aC9yaXNjdi9rdm0vdmNwdV9mcC5jICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDkgKy0K
PiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYyAgICAgICAgICAgICAgICAgICAgICAgfCAy
ODQgKystLS0tLS0tLS0tLS0tLS0tLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDMzICsrLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3Ni
aV9zdGEuYyAgICAgICAgICAgICAgICAgICAgICB8ICAxNiArLQo+ICBhcmNoL3Jpc2N2L2t2bS92
Y3B1X3RpbWVyLmMgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMyArLQo+ICBhcmNoL3Jpc2N2
L2t2bS92Y3B1X3ZlY3Rvci5jICAgICAgICAgICAgICAgICAgICAgICB8ICAxMSArLQo+ICBhcmNo
L3Jpc2N2L2t2bS92bS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA0OSArKyst
Cj4gIGFyY2gvcmlzY3Yva3ZtL3ZtaWQuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
ICAzICstCj4gIC4uLi90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9rdm1fdXRpbF90eXBl
cy5oIHwgICAyICsKPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvcmlzY3Yv
c2JpLmggICAgfCAgMzcgKysrCj4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIvcmlz
Y3YvcHJvY2Vzc29yLmMgIHwgICA1ICsKPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jp
c2N2L3NiaV9wbXVfdGVzdC5jICAgfCAgMjAgKy0KPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMv
a3ZtL3N0ZWFsX3RpbWUuYyAgICAgICAgICAgfCAgOTggKysrKystLQo+ICAyNyBmaWxlcyBjaGFu
Z2VkLCA5NTYgaW5zZXJ0aW9ucygrKSwgNTAxIGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faXNhLmgKPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfY29uZmlnLmgKPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGFyY2gvcmlzY3Yva3ZtL2lzYS5jCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNo
L3Jpc2N2L2t2bS92Y3B1X2NvbmZpZy5jCj4KCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdApr
dm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
