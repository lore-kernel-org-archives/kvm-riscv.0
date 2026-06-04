Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 372BECD6E4A
	for <kvm-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 15:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LgzyGiV5PjecAMhI68mbY+UZk8G/ziopNslUpVrZKT4=; b=GxoAxgdX8c5hYi
	8wowvDafKzos44qonOoL3EfHqJWLyMMyUUa+jaz/dDn2dIAkrcKM++H20T/NvNFX3O3S9TOZHIQXB
	RG1YR7qVkX4pxjydK8zl+H1koR8YnkJXlymQQ1yZalU8ye1CjgRc/Z3IwtU5XpkamGBlGgPiIAu4P
	tTb9F7MkG/O7diVVA0vRPN/M7zRNCT1uKTTXMtf5+5sI9kspFiTvKxeCF2BddzlM9GhA9ZuNn5/f0
	Im1PF6KVjqVlU0uwjwFFYJU2duupadI7E7y3wbbXf3ItwVgvAWg3yHkPo6/xKlhVTfXWpNA6xad3d
	yKfCvWuw1GZqKrTGRpeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVA0i-0000000Gzx7-1fjY;
	Thu, 04 Jun 2026 15:29:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVA0g-0000000Gzwo-3Q1t
	for kvm-riscv@bombadil.infradead.org;
	Thu, 04 Jun 2026 15:29:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=qzF1JQDHu/K7zEZi00iVkIXGDGc/cwKiYYKzelWhYfQ=; b=Z+5tUYnhUEMWFOf5Vuj1nEOIiu
	YiRD+IBMJcHYYLL2ohyf8ufrPTTYZ2kJ03jXHbBLGuDUWlaUQxPUJPVXEaqzyg+RDP5sRDJJGvrvH
	yVLRLLJZAwaE32LwpMg316lfv4aTvMSsnV4jdafdkSBMjZm1qUWYsEm6Uny8b2Dsbedk7pSTp/h4u
	vzqGGe/KLPfsRJHTlqk7XizfC0HFj7RJ6BLWpGs/eKim7+x32mje48jmhZs6wjQiOxr+IByliFmk/
	sZXbhcl30x1b/3q4/N+wWh8waCFjrxTqBbMpQm6fOSL3nmqH+Vs3IK7AvUERItLhAhNrfwfdxA6UB
	Hu8OC/Jw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wVA0d-0000000EVxc-0pCY
	for kvm-riscv@lists.infradead.org;
	Thu, 04 Jun 2026 15:29:29 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654CUG5j3240201
	for <kvm-riscv@lists.infradead.org>; Thu, 4 Jun 2026 15:29:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qzF1JQDHu/K7zEZi00iVkIXGDGc/cwKiYYKzelWhYfQ=; b=Qlncft6Fwh6BKW7n
	ka795Z+gVHHYDdEefWUmmoQD4RgUPeiGhHV8SLohswSyxQA7tUpBQh5QJy+w6cUx
	nthELcj2CqKsQtu8IWnnUGVBvx1B4CcqQbh0/tJI53DobGxPsWEKB0olLTomoQjJ
	dKokvTmQAdHSd8V/mrQrqOhm7qnHT3NPPfKphB5f08Ld+jJ4MMnuk4pGoYKPsYNR
	fBUyH5fUfYvPA9cIOWGy6Lhda0l5bMpg0n4kcqegrR9PrsGt3p4KFs11AYqkLbIx
	DPVLtwnic5BaEo8QCGinJHUSHwKzz5V/qJ+gTP541f0Kvr7AYVrKVIkHTnW2gfBI
	ME5ykQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejvd0bqtg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Thu, 04 Jun 2026 15:29:22 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-137f2083280so3398966c88.1
        for <kvm-riscv@lists.infradead.org>; Thu, 04 Jun 2026 08:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780586962; x=1781191762; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qzF1JQDHu/K7zEZi00iVkIXGDGc/cwKiYYKzelWhYfQ=;
        b=PQY4xoisAHcIFp3ZqGx8L+A879Su3bItc5JiDDHyVaIT/SVy1VhxW+H+uz/Oo9Av6u
         hjX7AToWfohX6kVtW8NLAS4EbbAPzDQCX0ZYcAzXquzixS0YK/jcZoA9ELfDfcRpU+sg
         kDXdAf/6lxZ20xkxVtr2amjfM6EzysESIEybxu2Cffuc/cLavD5dLwD70Z1j722TpE4s
         YipCNdZAs+8LMJa9qHTZZ/j9nKYp0wZ3H4qrlNRBxOcqQ2vQ9CK5t1dXA5Ldq1ourwat
         zoDf0rFiKdE4+HPPDreaARWyY264hum9d6ek8LKlRKxfnuZUSb6Ce3VRSRTmTAm6Ipfc
         Q4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780586962; x=1781191762;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qzF1JQDHu/K7zEZi00iVkIXGDGc/cwKiYYKzelWhYfQ=;
        b=eWwCYs0X12DWjLuZb6DbP5eUSXuv9d4qEtObnZ9Dj3j2LO42ineTYmhcUkp9p5qDwJ
         q5gy6sZxEWmZZYX80f0nyQ2djNJhLvu+ZsgSXnPfRDpE+5qDVvU8RsCdWCBweNGsiHVk
         MmUpOWzFmRhZ8g6nVZ0QgLkDInjUVqm49Vlq5Y1hvAW6nW4Yzp/1xTpxDjUHPJpjGDSV
         zSPRWoO74Mzp7OA2x4np5JGSWdwWNR6c/xV4Damp2GONvY0ckwZoGPk4Ze42D0/ERg7n
         9K9gAzIrnNOUkCIYqRdR2A5E29BglZJmsF+EmDJj3w+jMRiBqO/ikynltL2d+mT8I+cf
         EIJg==
X-Forwarded-Encrypted: i=1; AFNElJ9Pr1/ScEDxps7/hTGyxp2Aj7pLHCSzBS26sIkf+zeqN4B1g9nTxpJvZD+u1x0q8prMnAQbIO/PYhM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxcADmgvnuJAd73h+sROYa3gnOJWdDdXu5XMbPDE0bPD4oLQenI
	QEzk2wtcoMkqqvg9yF6psrFnUroxN9MJEsy7FCJPKCVa36I+B3U/9lYmTdFdcx3aq3E0X8SpnHe
	c/zk3eQ1Kq345uFNLPOFkUz5fpOrGn6FAGgoBMYeuseLVDOFNOYEdQwlu/010b3zUSnw5S6otIy
	Lc
X-Gm-Gg: Acq92OG/Z0ezkf0+vp9/qLRuzTZS17MGG6t37T/On3joQyXsLzr+kAAQ+NtfQpDNDhz
	aHl9+wSNcgbFMnDaZugLKBu+M8+gBWxHui7HLgbpHitQfgorZMpQ/+ZR++InbrkZ+lFijDT2tvR
	ahB8QS7I1a43aYOCbFnd7l09DE3cbcohlHbPjaIOgthaOSo5RHxANMmkDB4gVI+ahmg2qlJHSxX
	ahmaPTNjCDHbzkbxiDTRMJcf2VdZ4/AcmXqaYEKJb/PgWVJ7uQz2eBC4uyz/9gmnioRBizGrrdX
	shQUEZ1STGRx7iyax5CtEShdH+A9S/ZnpLZSgan4llXotH1O1T/JhFpjcCvJDl9aoSICYflyofh
	CMnpBGIA6TE2C+zJOeyLW4oXHOnl88axNyns9XwkrZg==
X-Received: by 2002:a05:7022:693:b0:136:90d9:f204 with SMTP id a92af1059eb24-137f6bb4bd5mr3557190c88.25.1780586961868;
        Thu, 04 Jun 2026 08:29:21 -0700 (PDT)
X-Received: by 2002:a05:7022:693:b0:136:90d9:f204 with SMTP id a92af1059eb24-137f6bb4bd5mr3557156c88.25.1780586961314;
        Thu, 04 Jun 2026 08:29:21 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f5539035sm4107408c88.11.2026.06.04.08.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 08:29:20 -0700 (PDT)
Date: Thu, 4 Jun 2026 10:29:19 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Guodong Xu <guodong@riscstar.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>,
        Atish Patra <atish.patra@linux.dev>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Deepak Gupta <debug@rivosinc.com>, Zong Li <zong.li@sifive.com>,
        Christian Brauner <brauner@kernel.org>,
        Charlie Jenkins <charlie@rivosinc.com>,
        Samuel Holland <samuel.holland@sifive.com>, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org, Guodong Xu <docularxu@outlook.com>
Subject: Re: [PATCH v2 08/10] riscv: cpufeature: Introduce ISA bases bitmap
 and rva23u64 detection
Message-ID: <ug2cipududshcbv24ruicqpugzinujnamvdcuy6pubkwh67bfp@2fysrplz3nr4>
References: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
 <20260511-rva23u64-hwprobe-v2-v2-8-21c5a544f1dc@riscstar.com>
 <5tjmypgyxbhgxfjub5q6ne475uysse6yl473sxisjoammkdvbu@yebejqbiy6e3>
 <CAH1PCMa-5W9PsX8cDLUk6-MkcM53HOz2QtaxCHd+XOr7DgH5+w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH1PCMa-5W9PsX8cDLUk6-MkcM53HOz2QtaxCHd+XOr7DgH5+w@mail.gmail.com>
X-Proofpoint-GUID: gaQtfV6LquYmxzVE1SCgKGI6M2eAdtWs
X-Authority-Analysis: v=2.4 cv=M8h97Sws c=1 sm=1 tr=0 ts=6a2199d2 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=c92rfblmAAAA:8 a=ee_2aqc6AAAA:8 a=VwQbUJbxAAAA:8 a=-RU_IiooM-Ar16elnkoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
 a=GvGzcOZaWPEFPQC_NcjD:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-ORIG-GUID: gaQtfV6LquYmxzVE1SCgKGI6M2eAdtWs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDE1MSBTYWx0ZWRfX5ARf8fF54MTo
 Mp/jq8J5ZEH64d9w2CDKSedMZ/sk1db/LpxkcEcqIB6lscwuK+d6hYhZD9SQYXn4uqvNST+hOdW
 VFEdz3jBHiHT9B9XCNGjndVtNXUQR8/VqDUwqqwImTWGceGRET/D/9tmtxuULTfzVpiaKOAMNz8
 skBu43EygOPkiJugWQ/dZuYQGpGs67fYGG7ZlRRooa4CMEixuu6Wlwki8qr2KY8roAbO0l1LzkC
 FrSpAFxYGKRyA/X3MUExUGNHTCzoCf1XEalo9M/6H+o/oKrbLCY9AwV4kvI5wMYwkzMDDF3TaJb
 nxRA8xt+ReQMgSn+fB/SrH2YQ40XvkFX5AfKv2YGDVkHcpOp8+cE+tXoqYFnQeWSYRpgRANeKOL
 8kqERnNFWDXo5t6unndF8V4VHHjQjk9fWqYBklcEBDfXCa7oTxFx8AGQw742bOLtjEtdtTNlN96
 exIUTSdtJMkDUCc3rVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_162927_535615_5A6B71A9 
X-CRM114-Status: GOOD (  31.72  )
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

T24gU2F0LCBNYXkgMzAsIDIwMjYgYXQgMDg6NDI6MjlBTSArMDgwMCwgR3VvZG9uZyBYdSB3cm90
ZToKPiBPbiBUaHUsIE1heSAyOCwgMjAyNiBhdCAxMjozNeKAr0FNIEFuZHJldyBKb25lcwo+ID4g
U2FzaGlrbyBwb2ludHMgb3V0IGEgZmV3IHRoaW5ncyBhYm91dCB0aGlzIHBhdGNoIHdoaWNoIEkg
dGhpbmsgSQo+ID4gYWdyZWUgd2l0aAo+ID4KPiA+IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRj
aHNldC8yMDI2MDUxMS1ydmEyM3U2NC1od3Byb2JlLXYyLXYyLTAtMjFjNWE1NDRmMWRjJTQwcmlz
Y3N0YXIuY29tP3BhcnQ9OAo+IAo+IFF1b3RlIHRoZSBmb2xsb3dpbmcgZnJvbSBTYXNoaWtvLmRl
djoKPiA+IFNob3VsZCB0aGlzIG1hc2sgc3BlY2lmeSB0aGUgaW5kaXZpZHVhbCBzdWJzZXQgZXh0
ZW5zaW9ucyByZXF1aXJlZCBieSB0aGUKPiA+IHByb2ZpbGUgaW5zdGVhZCBvZiB0aGUgc3VwZXJz
ZXQgZXh0ZW5zaW9ucyBsaWtlIFJJU0NWX0lTQV9FWFRfQiwKPiA+IFJJU0NWX0lTQV9FWFRfQywg
YW5kIFJJU0NWX0lTQV9FWFRfVj8KPiAKPiBNeSBwcmVmZXJlbmNlIGlzIHRvIGxlYXZlIHRoZSBt
YXNrIG9uIEIvQy9WIChhbmQgQSkgYXMtaXMuIEknZCBwcmVmZXIgdG8KPiBrZWVwIG1hdGNoaW5n
IG9uIHRoZSBzaW5nbGUtbGV0dGVyLCByYXRoZXIgdGhhbiBleHBhbmRpbmcgdGhlbS4gSGVyZSBp
cyB3aHk6Cj4gCj4gLSBUaGUgUlZBMjMgcHJvZmlsZSBsaXN0cyBBLCBCLCBDIGFuZCBWIGFzIHNp
bmdsZS1sZXR0ZXIgbWFuZGF0b3J5Cj4gICBleHRlbnNpb25zOyBpdCBkb2Vzbid0IGVudW1lcmF0
ZSBaYWFtby9aYWxyc2MsIFpiYS9aYmIvWmJzLCBaYyogb3IgdGhlCj4gICBadmUqL1p2bCogc3Vi
c2V0cyBpbiB0aGUgbWFuZGF0b3J5IHNldC4KPiAKPiAtIEluIGN1cnJlbnQgbWVyZ2VkIGNvZGUs
IGh3cHJvYmVfaXNhX2V4dDAoKSBpcyBhbHJlYWR5IHVzaW5nCj4gICByaXNjdl9pc2FfZXh0ZW5z
aW9uX2F2YWlsYWJsZSgpIHNpZ25sZSBsZXR0ZXIgY2hlY2tpbmcgZm9yIEMgYW5kIFYuCj4gCj4g
UFM6Cj4gQiBtYXliZSBhIHNwZWNpYWwgb25lLCBqdXN0IGluIGNhc2UgYW55Ym9keSByYWlzZSBp
dC4gQXMgdGhlIGNvbW11bml0eQo+IGRpc2N1c3NlZCB3aGVuIEkgYWRkaW5nIGl0IGludG8gdGhl
IGJpbmRpbmdzLCBiZWNhdXNlIEIgY29tZXMgbGF0ZXIgdGhhbgo+IGl0cyBzdWItY29tcG9uZW50
cyB6YmEvemJiL3picywgc28sIHdoZW4gSSBhZGRlZCBCLCBJIGNsZWFuZWQgdXAgYWxsCj4gaW4t
dHJlZSBkdHMgZmlsZXMgd2hpY2ggZGVjbGFyZWQgemJhL3piYi96YnMgYnV0IG5vdCBCIGFuZCBt
YWRlIHRoZW0gZGVjbGFyZQo+IGJvdGguCj4gCj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGludXgtcmlzY3YvMjAyNjAxMTUtYWRkaW5nLWItZHRzaS12Mi0wLTI1NGRkNjFjZjk0N0By
aXNjc3Rhci5jb20vCj4gWzFdCj4gCj4gQWxzbywgaW4gdGhlIGJpbmRpbmdzOiBleHRlbnNpb25z
LnlhbWwsIGEgc2NoZW1hIHJ1bGUgaXMgYWRkZWQgd2hpY2ggcmVxdWlyZXMKPiBhIG5vZGUgbGlz
dGluZyB6YmEsIHpiYiBhbmQgemJzIHRvIGFsc28gbGlzdCBiIChhbmQgdGhlIHJldmVyc2UpLiBN
b3Zpbmcgb24sCj4gbmV3IGR0c2kvZHRzIGZpbHMsIGEgbm9kZSB3aXRoIG9ubHkgdGhlIHN1YnNl
dHMgZmFpbHMgZHRic19jaGVjay4KPiAKPiBPbmUgbWF5IGFyZ3VlIHRoYXQgdGhlIHNjaGVtYSBj
aGVjayBkb2Vzbid0IGNvdmVyIEFDUEkgcGF0aC4gQnV0IGFnYWluLAo+IHNob3VsZG4ndCB0aGUg
dmVuZG9yIHdobyBwdWJsaXNocyBSVkEyMyBoYXJkd2FyZSBiZSBjb25mb3JtYW50IHRvIHRoZQo+
IGV4dGVuc2lvbnMgd29yZGluZyBpbiBSVkEyMyB2MS4wIHNwZWM/Cj4gCj4gV2hhdCBkbyB5b3Ug
dGhpbms/Cj4KCkkgY2VydGFpbmx5IHNlZSBhIGNhc2UgZm9yIHRoZSBrZXJuZWwgc3RheWluZyBv
dXQgb2YgdGhlIGV4dGVuc2lvbgpkZXBlbmRlbmN5IHZhbGlkYXRpb24gZ2FtZS4gSSB0aGluayBp
dCBtYWtlcyBzZW5zZSBmb3IgYW4gSVNBIHN0cmluZwp2YWxpZGF0aW9uIHRvb2wgdG8gZXhpc3Qg
Zm9yIHZlbmRvcnMgdG8gZG8gc2FuaXR5IGNoZWNrcyBvbiB0aGVpcgpJU0Egc3RyaW5ncywgYnV0
IHRoYXQncyBub3QgdGhlIGtlcm5lbCdzIHJvbGUuIE9UT0gsIHdoZXRoZXIgb3Igbm90CnRoZSBr
ZXJuZWwgd2FudHMgdG8gdHJ5IGFuZCBkZXRlY3QgaW5jb25zaXN0ZW5jaWVzIHdpdGggdGhlIElT
QQpzdHJpbmcgaW4gb3JkZXIgdG8gYnVpbGQgY29uZmlkZW5jZSBpbiB1c2luZyB3aGF0IGl0IHNl
ZXMgdGhlcmUKYW5kIHB1Ymxpc2hpbmcgd2hhdCBpdCBzZWVzIHRoZXJlIHRvIHVzZXJtb2RlLCB0
aHJvdWdoIGh3cHJvYmUsIG1pZ2h0CnN0aWxsIGJlIHdvcnRoIGRlYmF0aW5nLgoKV2l0aG91dCBD
UFVJRCAvIElEXyogcmVnaXN0ZXJzIGZvciBMaW51eCB0byBiZSBhYmxlIHRvIGNoZWNrIGFuCmF1
dGhvcml0YXRpdmUgc291cmNlIG9mIHRydXRoIGFib3V0IHdoYXQgaXMgYW5kIGlzbid0IHN1cHBv
cnRlZCBieQp0aGUgQ1BVLCByaXNjdiBMaW51eCBoYXMgdG8gZGVjaWRlIHRvIGVpdGhlciBibGlu
ZGx5IHRydXN0IHRoZQpoYXJkd2FyZSBkZXNjcmlwdGlvbiBvciBkbyBzYW5pdHkgY2hlY2tzIC8g
cHJvYmVzIGluIG9yZGVyIHRvCmNvbmZpcm0gd2hhdCBpdCBzZWVzIHRoZXJlLiBNYXliZSB3ZSBj
YW4gYXNzdW1lIHRoYXQgYW55IGV4dGVuc2lvbgp1c2VkIGJ5IHRoZSBrZXJuZWwgd2lsbCB0cmlw
IG92ZXIgaXRzZWxmIHF1aWNrbHksIGFsZXJ0aW5nIHZlbmRvcnMKdG8gZml4IHRoZWlyIElTQSBz
dHJpbmdzLCBidXQgSSdtIG5vdCBzdXJlIHdlIGNhbiBtYWtlIHRoYXQgYXNzdW1wdGlvbgpmb3Ig
dXNlcm1vZGUgZXh0ZW5zaW9ucyB0aGF0IExpbnV4IGRvZXNuJ3QgdXNlLCBidXQgZG9lcyBleHBv
c2UKdGhyb3VnaCBod3Byb2JlLiBXaGF0IGFwcHMgbmVlZCB0byBydW4gaW4gdGVzdGluZyB0byBl
eGVyY2lzZSB0aGVtPwpIb3cgbG9uZyB3aWxsIHRob3NlIGFwcHMgbmVlZCB0byBydW4gYmVmb3Jl
IHRoZXkgdHJpcCBvdmVyIHNvbWV0aGluZz8KClRoZSBtb3JlIEkgdGhpbmsgSSBhYm91dCBpdCwg
dGhlIG1vcmUgSSB0aGluayB0aGUgbGFjayBvZiBDUFVJRCAvIElEXyoKcmVnaXN0ZXJzIHB1dHMg
TGludXggaW4gYSB0aWdodCBzcG90LiBJZiBMaW51eCB0cnVzdGluZ2x5IHB1Ymxpc2hlcwp3aGF0
IGZpcm13YXJlIHRlbGxzIGl0IHRvIHRvIHVzZXJzcGFjZSBhbmQgdXNlcnNwYWNlIGJsb3dzIHVw
LCBMaW51eAp3aWxsIGhhdmUgdG8gc2hhcmUgc29tZSBvZiB0aGUgYmxhbWUgZm9yIGhhdmluZyBt
aXNsZWQgaXQuIFNvLCBzaG91bGQKTGludXggdmFsaWRhdGUgZXZlcnl0aGluZyBpdCBwdWJsaXNo
ZXMgc29tZWhvdz8gT3IsIHNob3VsZCBpdCBhdCBsZWFzdApkbyByZWxhdGl2ZWx5IGNoZWFwIHNh
bml0eSBjaGVja3Mgb24gZXZlcnl0aGluZyBpdCBwdWJsaXNoZXMgaW4gb3JkZXIKdG8gYnVpbGQg
c29tZSBjb25maWRlbmNlPwoKVGhhbmtzLApkcmV3CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlz
dAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
