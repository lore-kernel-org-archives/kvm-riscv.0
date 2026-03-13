Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D054105F7A6
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 13:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:From:To:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u3BWUCeQMC8gqdZyGqF5uovkRPXgE9FVFoYeW1Ae/nE=; b=z8IylE5iwGxE0m
	jsOpxxMkd7fpE1jkPsKOPdk+rVvqKE78wsSghXMs5IkMvhF29FnfhmI1VP+qd08afwjUrHaincGPC
	ugKCAPKr2oWSKhSYMfbGz6pKrsv6tdteRLgTLn5eAclAUjfvdIxxVMvJ7aG/eDerDkYg6HB3bryKt
	VlttwwgYcowWLFHXnqLmaq9Sx+4L8Zp/EYsbYPifTIKcLDHz+2jAGnjZGxCWLD0bPFjcE28oVRND3
	voDP05tFQ7CODiYhRl1lhM4uhoO3b4LbS43UiVs5qtPY2Yg6N9erb4gj5OqegVdUau4Oqf6OUPf8B
	2cuKq4cr1lIRph7OL0sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12Y3-00000000EeQ-0kQM;
	Fri, 13 Mar 2026 13:27:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12Y0-00000000Eby-21Fo
	for kvm-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 13:27:25 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DBrXkA4140736
	for <kvm-riscv@lists.infradead.org>; Fri, 13 Mar 2026 13:27:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1nlW109bb/HB/QDCXch5lmGmv1Xj5QyHaZAnML++DYY=; b=Y+ZaNBCQfFQuQhBo
	6p1N4DaISDil9CT8DRrLzQLJ1xsdyP1T9f8tpL7qVgwl8wwjq3yGeQWew4lQ7rO9
	I0BnNBvdxN+qjWkkby8onSiinQSsyp5cl11WdGnDbVLxdJPjHlAhP0eUG7KBb64T
	yr8FuoluaAhmgHc7GpDxTYrgrg9TRYwXs4W5l0QJfeC/8hCsmsKmpwZJ98MY/fIv
	ZyF0g/UDtgkcZE6qpa7uO3NDB7ybHwTIRGTeR9ApSABL48t6zfG9rsncNEfp6hvk
	pK3nttJexlTW3kX37DE1LoXdZfAyKX9kFZ0ncQ5t9XiBG4fbRwsskoa3HXyQtJ+p
	P7jFYw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvbn29rh1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Fri, 13 Mar 2026 13:27:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd849cd562so1376534785a.0
        for <kvm-riscv@lists.infradead.org>; Fri, 13 Mar 2026 06:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773408442; x=1774013242; darn=lists.infradead.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1nlW109bb/HB/QDCXch5lmGmv1Xj5QyHaZAnML++DYY=;
        b=Jkzor4DbXCDghOuloieuxsZwJOkRqOlYEU8fTzN9lIvrHD3p/iBIqQzOWOjpqAtbhp
         1j2Lur+MsfmqLulKpp0S8Aur7oJZx3SUPnW/fXfhwiJGcOnnCEJgvawp22n6HMdTYYLH
         mLPbTfOudnE9n4fME58skRgCPD3FBIGHvAzaT+bWpF++/o15ejegyH0Ii+w33NkDvHYK
         HTvLEY7EJTAMHI4bqeCC/3wZw8sKm4jqpTf8ZhVIFqiVS3L4NwJkYJfonQVKvkLVeKV8
         lmOnGY/d9Cau/K6gcud8Y+CvTPq/ooVJAbLaa0dlDhZs6G4TYXBiZzNeHZGJIyR1+vis
         +8Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773408442; x=1774013242;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1nlW109bb/HB/QDCXch5lmGmv1Xj5QyHaZAnML++DYY=;
        b=BK7dtFrn4xH3xyVETNGfkIDYw+DmMeO23YLPNVbVfWMza2gHsrGYK02ne3yYxY6PyZ
         qS8Ay0fx2DI+MUTawatd/7X6PhqiO6sFMOG0rXPOQniKlNA7DDP1tlyKeADmf0T7/mE2
         NkTZawJfFCXk8ACWZMnbtZxwdOBrwItKFx5G23Y6ZTTLjK/Zs6vW8So8OvB1fa3PWiij
         RpS6P2ezS0IUjT7IoDpcROKMVuhHuFrw6UrPWm4ZO+9nVp0eD/65a+t/mrzeP4ipJmc6
         IyG13neg1tr0+YVts7Kn6rl8WeTf2+ug/7Z9F38k6YYWOKMN+AIAQCbmZPeKNL+U9Eih
         7iMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVs8uIDqQ+nH6J4sEdEzPxvxyoOjrGci3fSd+/m57ID7b6BktFj+alAW4fdIduLFXhu3vg5BA6O47M=@lists.infradead.org
X-Gm-Message-State: AOJu0YzBus37gzX3GCdLIdANgxsxZyi72M6ewJvxzwEfWZhh7gf4db3+
	71xv1Dee0OJT6/g2o5U+IhOQ3CZBXRtvbbcke0tq0Vy5u2UzM01YQZ3ftDKKCiJxP8nJPa4MCB5
	hsW+F2Ea9tZRajOe0UHHrbYHhtA85sE7VV3iSv9LaUs/uHqIzs2dBEQ06CYUgFBDRjSvr
X-Gm-Gg: ATEYQzznDrs56gVgVWkV9yyL0Tjc/PO8k7OGfJHnEpWU2nWDf6FF0HRyxsc6uZmrN4f
	CgLwgyLgV8ffG5KmFrpiljZ5uAKanJrHEdMk1TqKex8of9NXLlRv/sGPWcCe4Sk352gDzpagj/c
	Fznugy/2j71e7ZVkD9eQIPL7R9LxYobRlPEqFl9u1cdgJ4P5ucY0pUDYybUn551+yga512aOarC
	4fM9Vtq9iXnc/hGrTZuaRnr8LmCN/4AyuqieBdyn3bsqVJrNBxWRCpsNwboqy+owiTfKWcTfoBF
	tjEtTyn3WCb+LErvQOpK8XJhQb4fT2GudjccjOJxTeT3bUvQz5lM3lItVhTjjwm5Zs0615an96R
	FsxvJ+xOuKzINvispVi1fvUtmS66ElOmmE6H/nk1Puhp8nNib9g97TxF3oq6b
X-Received: by 2002:a05:620a:2a11:b0:8cd:871c:909d with SMTP id af79cd13be357-8cdb5b5fc9emr450720885a.53.1773408441952;
        Fri, 13 Mar 2026 06:27:21 -0700 (PDT)
X-Received: by 2002:a05:620a:2a11:b0:8cd:871c:909d with SMTP id af79cd13be357-8cdb5b5fc9emr450714985a.53.1773408441464;
        Fri, 13 Mar 2026 06:27:21 -0700 (PDT)
Received: from localhost (ip-86-49-249-15.bb.vodafone.cz. [86.49.249.15])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe23afc5sm19683402f8f.39.2026.03.13.06.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:27:20 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 13 Mar 2026 14:27:19 +0100
Message-Id: <DH1OTQ0FHZLN.1RCIA8ERD3VGF@oss.qualcomm.com>
Cc: "Palmer Dabbelt" <palmer@dabbelt.com>, "Paul Walmsley" <pjw@kernel.org>,
        "Alexandre Ghiti" <alex@ghiti.fr>, "Shuah Khan" <shuah@kernel.org>,
        "Anup
 Patel" <anup@brainfault.org>,
        "Andrew Jones"
 <andrew.jones@oss.qualcomm.com>,
        <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-kselftest@vger.kernel.org>
To: "Anup Patel" <anup.patel@oss.qualcomm.com>,
        "Paolo Bonzini"
 <pbonzini@redhat.com>,
        "Atish Patra" <atish.patra@linux.dev>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
Subject: Re: [PATCH 09/27] RISC-V: KVM: Don't check hstateen0 when updating
 sstateen0 CSR
References: <20260120080013.2153519-1-anup.patel@oss.qualcomm.com>
 <20260120080013.2153519-10-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260120080013.2153519-10-anup.patel@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: tijXLoJHoFeLoL7Dpuor2K0IiLgZEiIk
X-Proofpoint-GUID: tijXLoJHoFeLoL7Dpuor2K0IiLgZEiIk
X-Authority-Analysis: v=2.4 cv=ZKfaWH7b c=1 sm=1 tr=0 ts=69b410bb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=fuErIE+P63Icv3tqjtEZBw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=MPGxGW8KdBHyhiCmLn8A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEwNyBTYWx0ZWRfX3YyR7XT+BCFA
 dpgy5jPsMAQH1THYPoRb3fVZlXJBDICvSVD7WZgozGRRVbIjKDeJfVYs+BWXSybCc2IRGMmll0r
 KSHiHEkgLAw8oOhY3qoCohmq3E/L7qJ0Q3djNg5x8ayouYthAuPb9OlP2x17CVgiWgihZ4pW2Sd
 L88A9F3910TqqASmybJLJzMFErATApHQq/aL0HJ5tbMHbvxy4NT0GQSqKOE4nlYMRJ5KV2XW7fq
 +tY3RDXwCU6pvIO8aek7dwCK8UPYOiQEyYAfbMlY4oR5LaQpD0eQdrKRLF0h4OQeZ9rIuBGOjIy
 RvVKvoqsr+vx1KeUnMYjTqEe9v3ZGIzbdQw+udOBO/xbTZfOC6fcGQ0eKACUiRsEJX4LxW05tQa
 8GT855R6NwGCiqlXAC/JmjzOy3wyDRrRmbqn//2cl+TfkvUo2kJAIIEh6bPRiSHvN+EfBNObznK
 PuHpx8mrjb6nfXYldwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_062724_548498_A65FC334 
X-CRM114-Status: GOOD (  11.09  )
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

MjAyNi0wMS0yMFQxMzoyOTo1NSswNTozMCwgQW51cCBQYXRlbCA8YW51cC5wYXRlbEBvc3MucXVh
bGNvbW0uY29tPjoKPiBUaGUgaHN0YXRlZW4wIHdpbGwgYmUgcHJvZ3JhbW1lZCBkaWZmZXJlbnRs
eSBmb3IgZ3Vlc3QgSFMtbW9kZQo+IGFuZCBndWVzdCBWUy9WVS1tb2RlIHNvIGRvbid0IGNoZWNr
IGhzdGF0ZWVuMC5TU1RBVEVFTjAgYml0IHdoZW4KPiB1cGRhdGluZyBzc3RhdGVlbjAgQ1NSIGlu
IGt2bV9yaXNjdl92Y3B1X3N3YXBfaW5fZ3Vlc3Rfc3RhdGUoKQo+IGFuZCBrdm1fcmlzY3ZfdmNw
dV9zd2FwX2luX2hvc3Rfc3RhdGUoKS4KPgo+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFu
dXAucGF0ZWxAb3NzLnF1YWxjb21tLmNvbT4KPiAtLS0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rdm0vdmNwdS5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdS5jCj4gQEAgLTcwMiwyOCArNzAyLDIy
IEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCBrdm1fcmlzY3ZfdmNwdV9zd2FwX2luX2d1
ZXN0X3N0YXRlKHN0cnVjdCBrdm1fdmNwdSAqCj4gLQlpZiAocmlzY3ZfaGFzX2V4dGVuc2lvbl91
bmxpa2VseShSSVNDVl9JU0FfRVhUX1NNU1RBVEVFTikgJiYKPiAtCSAgICAoY2ZnLT5oc3RhdGVl
bjAgJiBTTVNUQVRFRU4wX1NTVEFURUVOMCkpCj4gLQkJdmNwdS0+YXJjaC5ob3N0X3NzdGF0ZWVu
MCA9IGNzcl9zd2FwKENTUl9TU1RBVEVFTjAsCj4gLQkJCQkJCSAgICAgc21jc3ItPnNzdGF0ZWVu
MCk7Cj4gKwlpZiAocmlzY3ZfaGFzX2V4dGVuc2lvbl91bmxpa2VseShSSVNDVl9JU0FfRVhUX1NN
U1RBVEVFTikpCj4gKwkJdmNwdS0+YXJjaC5ob3N0X3NzdGF0ZWVuMCA9IGNzcl9zd2FwKENTUl9T
U1RBVEVFTjAsIHNtY3NyLT5zc3RhdGVlbjApOwoKVGhpcyBjb3VsZCBldmVuIGJlIGNvbnNpZGVy
ZWQgYXMgYSBmaXgsIGFsdGhvdWdoIHRoZXJlIGlzIG5vIGJ1ZyBhdCB0aGUKbW9tZW50IChib3Ro
IGhvc3QgYW5kIGd1ZXN0IHNzdGF0ZWVuIGFyZSBhbHdheXMgMCkuCkluIHRoZSBmdXR1cmUsIGV4
ZWN1dGlvbiBvZiBhIGd1ZXN0IG1pZ2h0IGhhdmUgYmVlbiB0YW1wZXJpbmcgd2l0aCB0aGUKaG9z
dCBzc3RhdGVlbiwgYmVjYXVzZSBzc3RhdGVlbiBpcyBhY3RpdmUgZXZlbiB3aGVuIGhzdGF0ZWVu
LlNFMD0wLgoKUmV2aWV3ZWQtYnk6IFJhZGltIEtyxI1tw6HFmSA8cmFkaW0ua3JjbWFyQG9zcy5x
dWFsY29tbS5jb20+CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2t2bS1yaXNjdgo=
