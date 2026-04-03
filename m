Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB80E8537A
	for <kvm-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 16:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=apkWZcZDq9M1UM782Ls9gyH4Tp20Az0Wl2bgyjpMIG0=; b=cA/gF4a7IR/Shy
	/7lTcmM4ANXNcgF8CtRBA6/7k0NjOC5IeT/3u6ECCZWt2ydXAttkI+K2tt6nWpfhJH8T64Rih/eLw
	/027Lp1QZi5qURU0FfVb25fyk07IEqmCStzZtOzp+egrBwTNx1y3QNSqbzUbj8BEKuAfVIg26bZWP
	9AKZehQUYLLK1elZoos0zWBF/CwgEPRMkZKoRrJMDL7+QYagV1nN18U7KILn59yhx5eJrmSHfUdfI
	vLeUWh5PIv10mGrNuYhLo6bTYDknaAe30TRN2qz6PbHYPEAQOmFiu85rYUk1qW5Iv6GRamO3NKuDB
	TUIKlrSIXt91NdQr/Ifg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8hcz-00000002LWv-05nq;
	Fri, 03 Apr 2026 16:44:13 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8hcw-00000002LW5-1bsF
	for kvm-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 16:44:11 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-679f6ee3fb0so792955eaf.2
        for <kvm-riscv@lists.infradead.org>; Fri, 03 Apr 2026 09:44:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775234649; cv=none;
        d=google.com; s=arc-20240605;
        b=fwbi7rirOyxuswG2ccgD3hBbDBL4C6YcEY+k5t8wzv1hA0Uv3ZGgJn1+wwvEK7v8T5
         CozBlOiUjBrwuB5NaOUd3pJhdhW8vUeKhF7XcRII02vm+kNoJDHMckm1FvX70AHHJ4eK
         pjo3MzKraYsBbtcUEUbM/H5UfVfpXe9n4q78i/Yzupv8ZCBHwr6cErJU2DUN4E3WWK27
         Z1J92yE4iRESRsDPAe1WuRXcRdRJGGHrSGXo0gDWse+WNAMHl41l3mPdQZ5tJ9NocZox
         Vur5Va8Fgx3qipFq2sqm0zRYQUz+tAdv8cB6Mb6SF1jFrnTBAybdjCZXkpSOJrln7oiG
         bKJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vrFTwfPigxbz2O9GmqMaSTkCzHO8oMgBfOsFDsbGC0M=;
        fh=Qcmw0or3NBEf4zfMZi4oS9+SHQlYRqEo0yCVe/WQjAs=;
        b=Qy3H60boRpcSCEwMVeIv8xg5aDNJ5AvMCihDG170Y4oNgGhxjivYiPP67ZaUoHXtMM
         cuZrPDI/xK0rxWvdHcGqvfi4Ajn5/WUxmAFQnnJIT9LahN9+OXJyjYPYIf6BstYw+fla
         DVytevvjKMNN1cINGU0Hg9izMxmMDUdJO+pj5bak1Qmt7hYmFnMO/FxvLHFUO0yFZPoC
         g4YQsYQWUArRaDhbTGSiR6kdkQ7bBobSacFuVCQ6EioYy5upsKmIH32BSAvl7a6xUgf6
         L8dBs8ELgIfNTNHTsC5HnrF2EXaJ/omKnNsfjYbpZPWPhHZy1TCNGl9z3i+90IKpAu3W
         sO8w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1775234649; x=1775839449; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vrFTwfPigxbz2O9GmqMaSTkCzHO8oMgBfOsFDsbGC0M=;
        b=NnYpZyRIdVGHB3/AV9saVzVbJYbXejGRXw+NiiYWqVv+wx1mT6H4VgaD1OlZnAgu+E
         VyczL/EdDV22Mwb9m+pokBHzQzPjN38VveulWX40hhX41+8ZrdRqL46+EuZXwl3gSahI
         YKRikfrgy8kdLFz92mSUbLHPH9fMJKtqKC7BfHQFqItmHfMuT2rItsGYy1AJ/nxfLzuK
         mbMC2HXVsPKe8RjuKDhc0qsd5EEbOWM5g7yqWBZsNSO/5XmJiX1nmaBYQ44qkEZnZuU2
         ijvvuzWFrrsUnTOI9Sc46nLIlXK6HAHlXslcYL5pjIZMqW4tpQXzQ1J9Uw4A4z6i7vKZ
         j+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775234649; x=1775839449;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vrFTwfPigxbz2O9GmqMaSTkCzHO8oMgBfOsFDsbGC0M=;
        b=RNfynsk2U1PTuNfNqOznjXE4ANojP1W7OGKL6xZ241OlF85JsxFVuflO1ddN9up2n2
         W11erAy9SAMTf3X0qWeUzTAP3vJtDy5vhpTIygah0BbZd9YZ/POrHqh2UwnKL/uQamWL
         tHUqcPqKV3upwKb2T08QBg+UqG5EhWvoEVWSDWqBuFROJySRQeAkGnMRtASSUrDGF0C2
         r5vU7QNPFczgQbOR3Ym0l5f2mxT3uu7CuWjdt6rck4Pa0BeBs07XHm5JxmA98hzWigkI
         8Kj7XaQiJeiOu4Mpcza0nWm08cwPK0X2f+BmO7efFjI3je/4R3z0n0oyLkghWJd6Rr1a
         Krvg==
X-Forwarded-Encrypted: i=1; AJvYcCW6dOU8XBIr6N/ejWT1Gl0rquWoSu0T65VX+rLck3rsC2p9Jy9EeCSCF8li0iRhvXBSlH8nANWswVc=@lists.infradead.org
X-Gm-Message-State: AOJu0YycoK9DMmt8kCbeOjBXcV/jqLCogxiPul0Y9igRnCrL71Dh7rBA
	57dOgEz+li0bpvbhLE9sTWNAwYGHFTNGy5gaYtD+JGHM5kJxi1XY6BIzG7uHYBrSW5A2ZHX98nr
	EoEkDM0zU6i//zCSOd/NbkcPufX+DviX3MIoZMAMSDw==
X-Gm-Gg: ATEYQzxYkxX+MCSzRgeHUDLwOz5uzJ4VJa+rEuk2TyrXvqtp0MeBhshix0TKlGzBE6y
	nU5zzz87qb62eerfkfRDhVKmzb0axyWtb04rQvdMWhpuidvvgGqmMIYXjzknZSGvAjTJP6NkDIO
	pTyP6au2TfwwH0peMann2PjQpmqIXBBhe+dXG986qiYueE/AJ5ft6fe/JMq1IXJbki6bkn2H4bb
	0Amvpa7Ai41xlttV43EqMBJA+QmqgXm4LdvjXc9rgLzt1gPuehuMBj8cAu85/INAKwDVEXuRVsT
	3Fe8AVRxNmz/J5yPpdCaTE0akCWrXtKXoe1IZ5VCSsqvN9sCJCBc+SC1iOjmt5sFTaIEPg5bA0q
	jdAW5IdqD1FygNfyD0K/G2rxwUA==
X-Received: by 2002:a05:6820:81c3:b0:67f:c458:2b7d with SMTP id
 006d021491bc7-68221529e11mr1810015eaf.47.1775234649157; Fri, 03 Apr 2026
 09:44:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260403153019.9916-1-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260403153019.9916-1-fangyu.yu@linux.alibaba.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 3 Apr 2026 22:13:57 +0530
X-Gm-Features: AQROBzCaf8PzOUDM_iKq7XQvuf1-ZWCZZHG4AUTGxCQXiafdpkeYzci0INwbejE
Message-ID: <CAAhSdy0W7vrxHeMF+taZ0EBawsqis-ygwu=0HDV2WQYVerbZ9A@mail.gmail.com>
Subject: Re: [PATCH v8 0/3] Support runtime configuration for per-VM's HGATP mode
To: fangyu.yu@linux.alibaba.com
Cc: pbonzini@redhat.com, corbet@lwn.net, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	skhan@linuxfoundation.org, guoren@kernel.org, radim.krcmar@oss.qualcomm.com, 
	andrew.jones@oss.qualcomm.com, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_094410_437726_F3D1B84E 
X-CRM114-Status: GOOD (  19.12  )
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

T24gRnJpLCBBcHIgMywgMjAyNiBhdCA5OjAw4oCvUE0gPGZhbmd5dS55dUBsaW51eC5hbGliYWJh
LmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBGYW5neXUgWXUgPGZhbmd5dS55dUBsaW51eC5hbGliYWJh
LmNvbT4KPgo+IEN1cnJlbnRseSwgUklTQy1WIEtWTSBoYXJkY29kZXMgdGhlIEctc3RhZ2UgcGFn
ZSB0YWJsZSBmb3JtYXQgKEhHQVRQIG1vZGUpCj4gdG8gdGhlIG1heGltdW0gbW9kZSBkZXRlY3Rl
ZCBhdCBib290IHRpbWUgKGUuZy4sIFNWNTd4NCBpZiBzdXBwb3J0ZWQpLiBidXQKPiBvZnRlbiBz
dWNoIGEgd2lkZSBHUEEgaXMgdW5uZWNlc3NhcnksIGp1c3QgYXMgYSBob3N0IHNvbWV0aW1lcyBk
b2Vzbid0IG5lZWQKPiBzdjU3Lgo+Cj4gVGhpcyBwYXRjaCByZXVzZSBLVk1fQ0FQX1ZNX0dQQV9C
SVRTIHRvIHNlbGVjdCBIR0FUUC5NT0RFLiBVc2VyLXNwYWNlIGNhbgo+IG5vdyBleHBsaWNpdGx5
IHJlcXVlc3QgYSBzcGVjaWZpYyBIR0FUUCBtb2RlIChTVjM5eDQsIFNWNDh4NCwgU1Y1N3g0IG9y
Cj4gU1YzMng0KSBkdXJpbmcgVk0gY3JlYXRpb24uCj4KPiAtLS0KPiBDaGFuZ2VzIGluIHY4Ogo+
ICAgICAtIFJldXNlIEtWTV9DQVBfVk1fR1BBX0JJVFMgdG8gYWR2ZXJ0aXNlIGFuZCBzZWxlY3Qg
dGhlIGVmZmVjdGl2ZSBHUEEgd2lkdGgKPiAgICAgICBmb3IgYSBWTSAoQW51cCdzIHN1Z2dlc3Rp
b24pLgo+ICAgICAtIEhhbmRsZSB0aGUga3ZtID09IE5VTEwgY2FzZSBhbmQgdGFzayBrdm0tPmxv
Y2sgYW5kIGt2bS0+c2xvdHNfbG9jayB0byBzZXJpYWxpemUKPiAgICAgICBhZ2FpbnN0IGNvbmN1
cnJlbnQgdkNQVSBjcmVhdGlvbiBhbmQgbWVtc2xvdCB1cGRhdGVzIChSYWRpbSdzIHN1Z2dlc3Rp
b24pLgo+ICAgICAtIExpbmsgdG8gdjc6Cj4gICAgICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGludXgtcmlzY3YvMjAyNjA0MDIxMzIzMDMuNjI1Mi0xLWZhbmd5dS55dUBsaW51eC5hbGliYWJh
LmNvbS8KPiAtLS0KPiBDaGFuZ2VzIGluIHY3IChBbnVwJ3Mgc3VnZ2VzdGlvbnMpOgo+ICAgICAt
IEtlZXAgdGhlIG9yaWdpbmFsIEhHQVRQIG1vZGUgcHJvYmluZyBsb2dpYy4KPiAgICAgLSBMaW5r
IHRvIHY2Ogo+ICAgICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjYw
MzMwMTIyNjAxLjIyMTQwLTEtZmFuZ3l1Lnl1QGxpbnV4LmFsaWJhYmEuY29tLwo+IC0tLQo+IENo
YW5nZXMgaW4gdjYgKEFudXAncyBzdWdnZXN0aW9ucyk6Cj4gICAgIC0gUmV3b3JrZWQga3ZtX3Jp
c2N2X2dzdGFnZV9ncGFfYml0cygpIGFuZCBrdm1fcmlzY3ZfZ3N0YWdlX2dwYV9zaXplKCkgdG8K
PiAgICAgICB0YWtlICJ1bnNpZ25lZCBsb25nIHBnZF9sZXZlbHMiIGluc3RlYWQgb2YgInN0cnVj
dCBrdm1fYXJjaCAqIi4KPiAgICAgLSBNb3ZlZCBrdm1fcmlzY3ZfZ3N0YWdlX21vZGUoKSBoZWxw
ZXIgZnJvbSBrdm1faG9zdC5oIHRvIGt2bV9nc3RhZ2UuaC4KPiAgICAgLSBSZW5hbWVkIGt2bS0+
YXJjaC5rdm1fcmlzY3ZfZ3N0YWdlX3BnZF9sZXZlbHMgdG8ga3ZtLT5hcmNoLnBnZF9sZXZlbHMu
Cj4gICAgIC0gQWRkZWQgcGdkX2xldmVscyB0byBzdHJ1Y3Qga3ZtX2dzdGFnZSB0byBhdm9pZCBy
ZXBlYXRlZAo+ICAgICAgIGdzdGFnZS0+a3ZtLT5hcmNoIHBvaW50ZXIgY2hhc2luZy4KPiAgICAg
LSBMaW5rIHRvIHY1Ogo+ICAgICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2
LzIwMjYwMjA0MTM0NTA3LjMzOTEyLTEtZmFuZ3l1Lnl1QGxpbnV4LmFsaWJhYmEuY29tLwo+IC0t
LQo+IENoYW5nZXMgaW4gdjU6Cj4gICAgIC0gVXNlIGFyY2hpdGVjdHVyYWwgSEdBVFAuTU9ERSBl
bmNvZGluZ3MgYXMgdGhlIGJpdCBpbmRleCBmb3IgdGhlIHN1cHBvcnRlZC1tb2RlCj4gICAgICAg
Yml0bWFwIGFuZCBmb3IgdGhlIFZNLW1vZGUgc2VsZWN0aW9uIFVBUEk7IG5vIG5ldyBVQVBJIG1v
ZGUvYml0IGRlZmluZXMgYXJlCj4gICAgICAgaW50cm9kdWNlZChwZXIgUmFkaW0pLgo+ICAgICAt
IEFsbG93IEtWTV9DQVBfUklTQ1ZfU0VUX0hHQVRQX01PREUgb24gUlYzMiBhcyB3ZWxsKHBlciBE
cmV3KS4KPiAgICAgLSBMaW5rIHRvIHY0Ogo+ICAgICAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2xpbnV4LXJpc2N2LzIwMjYwMjAyMTQwNzE2LjM0MzIzLTEtZmFuZ3l1Lnl1QGxpbnV4LmFsaWJh
YmEuY29tLwo+IC0tLQo+IENoYW5nZXMgaW4gdjQ6Cj4gICAgIC0gRXh0ZW5kIGt2bV9yaXNjdl9n
c3RhZ2VfbW9kZV9kZXRlY3QoKSB0byBwcm9iZSBhbGwgSEdBVFAuTU9ERSB2YWx1ZXMKPiAgICAg
ICBzdXBwb3J0ZWQgYnkgdGhlIGhvc3QgYW5kIHJlY29yZCB0aGVtIGluIGEgYml0bWFzay4KPiAg
ICAgLSBUcmVhdCB1bmV4cGVjdGVkIHBnZF9sZXZlbHMgaW4ga3ZtX3Jpc2N2X2dzdGFnZV9tb2Rl
KCkgYXMgYW4gaW50ZXJuYWwgZXJyb3IKPiAgICAgICAoZS5nLiBXQVJOX09OX09OQ0UoKSkocGVy
IFJhZGltKS4KPiAgICAgLSBNb3ZlIGt2bV9yaXNjdl9nc3RhZ2VfZ3BhX2JpdHMoKSBhbmQga3Zt
X3Jpc2N2X2dzdGFnZV9ncGFfc2l6ZSgpIHRvIGhlYWRlcgo+ICAgICAgIGFzIHN0YXRpYyBpbmxp
bmUgaGVscGVycyhwZXIgUmFkaW0pLgo+ICAgICAtIERyb3AgZ3N0YWdlX21vZGVfdXNlcl9pbml0
aWFsaXplZCBhbmQgUmVtb3ZlIHRoZSBrdm1fZGVidWcoKSBtZXNzYWdlIGZyb20KPiAgICAgICBL
Vk1fQ0FQX1JJU0NWX1NFVF9IR0FUUF9NT0RFKHBlciBSYWRpbSkuCj4gICAgIC0gTGluayB0byB2
MzoKPiAgICAgICBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI2MDEyNTE1
MDQ1MC4yNzA2OC0xLWZhbmd5dS55dUBsaW51eC5hbGliYWJhLmNvbS8KPiAtLS0KPiBDaGFuZ2Vz
IGluIHYzOgo+ICAgICAtIFJld29ya2VkIHRoZSBwYXRjaCBmb3JtYXR0aW5nIChwZXIgRHJldyku
Cj4gICAgIC0gRHJvcHBlZCBrdm0tPmFyY2gua3ZtX3Jpc2N2X2dzdGFnZV9tb2RlIGFuZCBkZXJp
dmUgSEdBVFAuTU9ERSBmcm9tCj4gICAgICAga3ZtX3Jpc2N2X2dzdGFnZV9wZ2RfbGV2ZWxzIHZp
YSBhIGhlbHBlciwgYXZvaWRpbmcgcmVkdW5kYW50IHBlci1WTSBzdGF0ZShwZXIgRHJldykuCj4g
ICAgIC0gUmVtb3ZlZCBrdm1fcmlzY3ZfZ3N0YWdlX21heF9tb2RlIGFuZCBrZWVwIG9ubHkga3Zt
X3Jpc2N2X2dzdGFnZV9tYXhfcGdkX2xldmVscwo+ICAgICAgIGZvciBob3N0IGNhcGFiaWxpdHkg
ZGV0ZWN0aW9uKHBlciBEcmV3KS4KPiAgICAgLSBPdGhlciBpbml0aWFsaXphdGlvbiBhbmQgcmV0
dXJuIHZhbHVlIGlzc3VlcyhwZXIgRHJldykuCj4gICAgIC0gRW5mb3JjZSB0aGF0IEtWTV9DQVBf
UklTQ1ZfU0VUX0hHQVRQX01PREUgY2FuIG9ubHkgYmUgZW5hYmxlZCBiZWZvcmUgYW55IHZDUFVz
Cj4gICAgICAgYXJlIGNyZWF0ZWQgYnkgcmVqZWN0aW5nIHRoZSBpb2N0bCBvbmNlIGt2bS0+Y3Jl
YXRlZF92Y3B1cyBpcyBub24temVybyhwZXIgUmFkaW0pLgo+ICAgICAtIEFkZCBhIG1lbXNsb3Qg
c2FmZXR5IGNoZWNrIGFuZCByZWplY3QgdGhlIGNhcGFiaWxpdHkgdW5sZXNzCj4gICAgICAga3Zt
X2FyZV9hbGxfbWVtc2xvdHNfZW1wdHkoa3ZtKSBpcyB0cnVlLCBlbnN1cmluZyB0aGUgRy1zdGFn
ZSBmb3JtYXQgaXMgbm90Cj4gICAgICAgY2hhbmdlZCBhZnRlciBhbnkgbWVtc2xvdHMgaGF2ZSBi
ZWVuIGluc3RhbGxlZChwZXIgUmFkaW0pLgo+ICAgICAtIExpbmsgdG8gdjI6Cj4gICAgICAgaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyNjAxMDUxNDMyMzIuNzY3MTUtMS1m
YW5neXUueXVAbGludXguYWxpYmFiYS5jb20vCj4KPiBGYW5neXUgWXUgKDMpOgo+ICAgUklTQy1W
OiBLVk06IFN1cHBvcnQgcnVudGltZSBjb25maWd1cmF0aW9uIGZvciBwZXItVk0ncyBIR0FUUCBt
b2RlCj4gICBSSVNDLVY6IEtWTTogQ2FjaGUgZ3N0YWdlIHBnZF9sZXZlbHMgaW4gc3RydWN0IGt2
bV9nc3RhZ2UKPiAgIFJJU0MtVjogS1ZNOiBSZXVzZSBLVk1fQ0FQX1ZNX0dQQV9CSVRTIHRvIHNl
bGVjdCBIR0FUUC5NT0RFCj4KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1fZ3N0YWdlLmgg
fCA0NyArKysrKysrKysrKysrKysrLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2hv
c3QuaCAgIHwgIDEgKwo+ICBhcmNoL3Jpc2N2L2t2bS9nc3RhZ2UuYyAgICAgICAgICAgICB8IDY1
ICsrKysrKysrKysrKystLS0tLS0tLS0tLS0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9tYWluLmMgICAg
ICAgICAgICAgICB8IDEyICsrLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL21tdS5jICAgICAgICAgICAg
ICAgIHwgNzAgKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgYXJjaC9yaXNjdi9rdm0v
dm0uYyAgICAgICAgICAgICAgICAgfCA0OSArKysrKysrKysrKysrKysrKystLQo+ICBhcmNoL3Jp
c2N2L2t2bS92bWlkLmMgICAgICAgICAgICAgICB8ICAzICstCj4gIDcgZmlsZXMgY2hhbmdlZCwg
MTQ4IGluc2VydGlvbnMoKyksIDk5IGRlbGV0aW9ucygtKQo+Cj4gLS0KPiAyLjUwLjEKPgoKVGhp
cyBzZXJpZXMgaXMgaW4gZ29vZCBzaGFwZSBub3cuIEkgd2lsbCB3YWl0IG9uZSBtb3JlIGRheSB0
byBzZWUKaWYgdGhlcmUgYXJlIGFueSBjb21tZW50cyBhbmQgYWZ0ZXIgdGhhdCBJIHdpbGwgbWVy
Z2UgZm9yIExpbnV4LTcuMQoKVGhhbmtzLApBbnVwCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlz
dAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
